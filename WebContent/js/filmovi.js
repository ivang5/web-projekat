$(document).ready(function(){

    var clicks = 0;

    $("#pretragaDugme").click(function (e) {
        if(clicks == 0){
            $("#pretragaDugme").html("pretraga &#8679");
            $("#pretraga").fadeIn( 1200 , function(){
                document.getElementById("pretraga").style.display = "unset";
            });
        }else if (clicks % 2 !== 0) { 
            $("#pretragaDugme").html("pretraga &#8681");
            $("#pretraga").hide();
         }else if(clicks % 2 == 0) {
            $("#pretragaDugme").html("pretraga &#8679");
            $("#pretraga").show();
         }
         clicks++;
         e.preventDefault();
         return false;
    });
    
    
    //Tabela
    var nazivInput = $('#nazivInput');
    var zanrInput = $('#zanrInput');
    var trajanjeOdInput = $('#trajanjeOdInput');
    var trajanjeDoInput = $('#trajanjeDoInput');
    var distributerInput = $('#distributerInput');
    var zemljaPoreklaInput = $('#zemljaPoreklaInput');
    var godinaOdInput = $('#godinaOdInput');
    var godinaDoInput = $('#godinaDoInput');
    
    var tabelaFilmova = $('#tabelaFilmova');
    
    var mySection = $('#mySection');
    var btnDodajFilm;

    //Navigacija
    var navigationButtons = $('#navigationButtons');
    var btnOdjava;
    var btnMojNalog;
    var btnKorisnici;
    var btnIzvestavanje;
    makeButtons();
    changeInterface();
    getFilmovi();
    
    
    function getFilmovi() {
    	var nazivFilter = nazivInput.val();
    	var zanrFilter = zanrInput.val();
    	var trajanjeOdFilter = trajanjeOdInput.val();
    	var trajanjeDoFilter = trajanjeDoInput.val();
    	var distributerFilter = distributerInput.val();
    	var zemljaPoreklaFilter = zemljaPoreklaInput.val();
    	var godinaOdFilter = godinaOdInput.val();
    	var godinaDoFilter = godinaDoInput.val();
    	
    	var params = {
    		'nazivFilter' : nazivFilter,
    		'zanrFilter' : zanrFilter,
    		'trajanjeOdFilter' : trajanjeOdFilter,
    		'trajanjeDoFilter' : trajanjeDoFilter,
    		'distributerFilter' : distributerFilter,
    		'zemljaPoreklaFilter' : zemljaPoreklaFilter,
    		'godinaOdFilter' : godinaOdFilter,
    		'godinaDoFilter' : godinaDoFilter,
    	};
    	
    	console.log(params);
    	$.get('FilmServlet', params, function(data){
    		if (data.status == 'success') {
    			tabelaFilmova.find('tbody').remove();
    			
    			var filtriraniFilmovi = data.filtriraniFilmovi;
    			console.log(data.filtriraniFilmovi);
    			for(ff in filtriraniFilmovi) {
    				tabelaFilmova.append(
						'<tbody>' +
			                '<tr>' + 
			                  '<td align="left"><a href="film.html?id=' + filtriraniFilmovi[ff].id + '">' + filtriraniFilmovi[ff].naziv + '</a></td>' + 
			                  '<td align="left">' + filtriraniFilmovi[ff].zanrovi + '</td>' + 
			                  '<td align="left">' + filtriraniFilmovi[ff].trajanje + '</td>' +
			                  '<td align="left">' + filtriraniFilmovi[ff].distributer + '</td>' +
			                  '<td align="left">' + filtriraniFilmovi[ff].zemljaPorekla + '</td>' +
			                  '<td align="left">' + filtriraniFilmovi[ff].godinaProizvodnje + '</td>' +
			                '</tr>' +
		                '</tbody>'	
    				)
    			}
    		}
    	});
    }
    
    function changeInterface() {
		$.get('UserServlet', {'action': 'loggedInUserRole'}, function(data) {
			console.log(data.status);
			if (data.status == 'unauthenticated') {
				$('#btnOdjava').remove();
				$('#btnMojNalog').remove();
				$('#btnKorisnici').remove();
				$('#btnRegistracija').show();
				$('#btnPrijava').show();
				return;
			}
		
			if (data.status == 'success') {
				$('#btnRegistracija').hide();
				$('#btnPrijava').hide();
				console.log(data.loggedInUserRole);
				
				if(data.loggedInUserRole == 'ADMINISTRATOR'){
					navigationButtons.append(btnKorisnici);
					navigationButtons.append(btnIzvestavanje);
					mySection.append(btnDodajFilm);
				}
				navigationButtons.append(btnMojNalog);
				navigationButtons.append(btnOdjava);
				return;
			}
		});
    }
    
    function makeButtons() {
    	btnOdjava = $('<li id="btnOdjava"><a class="nav-link" href="">Odjavi se</a></li>').on('click', function() {
    		$.get('LogoutServlet', function(data) {
    			console.log(data);
    			
    			if (data.status == 'unauthenticated') {
    				changeInterface();
    				console.log('Odjavljen');
    				return;
    			}else {
    				console.log("Greska");
    			}
    		});
    		$('input').val('');
    		location.reload();
    		return false;
    	});
    	
    	btnMojNalog = $('<li id="btnMojNalog"><a class="nav-link" href="#">Moj nalog</a></li>').on('click', function(){
            let param = { 'action' : "loggedInUserId"}
            $.get('UserServlet', param, function(data) {
            	if (data.status == 'success') {
            		let url = 'profil.html?id=' + data.loggedInUserId;
            		window.location.replace(url);
            		return;
            	}
            });
         });
    	
    	btnKorisnici = $('<li id="btnKorisnici"><a class="nav-link" href="korisnici.html">Korisnici</a></li>');
        btnIzvestavanje = $('<li id="btnIzvestavanje"><a class="nav-link" href="izvestavanje.html">Izvestavanje</a></li>');
        
        btnDodajFilm = $('<button type="button" id="noviFilm" class="btn btn-light">Dodaj film</button>').on('click', function(){
        	window.location.replace('dodajFilm.html');
        });
    }
    
    $('#loginSubmit').on('click', function(event) {
    	var loginInputUsername = $('#loginInputUsername');
        var loginInputPassword = $('#loginInputPassword');
		var userName = loginInputUsername.val();
		var password = loginInputPassword.val();	

		var params = {
			'userName': userName, 
			'password': password
		}
		console.log(params);
        $.post('LoginServlet', params, function(data) { 
        	
			if (data.status == 'failure') {
				loginInputUsername.val('');
				loginInputPassword.val('');

				return;
			}
			if (data.status == 'success') {
				window.location.replace('index.html');
			}
        });
        
        event.preventDefault();
		return false;
	});
    
    $('#registrationSubmit').click(function (e) {
    	var registrationInputUsername = $('#registrationInputUsername');
        var registrationInputPassword = $('#registrationInputPassword');
        var registrationInputRepeatPassword = $('#registrationInputRepeatPassword');

        if($('#registrationInputUsername').val() == "" || $('#registrationInputPassword').val() == "" || $('#registrationInputRepeatPassword').val() == ""){
            alert('Niste uneli sve potrebne informacije!');
            return;
        }

        if($('#registrationInputPassword').val() != $('#registrationInputRepeatPassword').val()){
            alert('Unete lozinke nisu iste!');
            return;
        }
        
        $.ajaxSetup({async: false});

        var params = {
            'userName' : registrationInputUsername.val(),
            'password' : registrationInputPassword.val(),
        };

        $.post('RegistrationServlet', params, function(data){
            if (data.status == 'success') {
              alert('Uspesno ste se registrovali!');
              window.location.replace("index.html");
              return;
            }else{
                alert(data.message);
            }
    
        });

    });
    
    nazivInput.on('change', function(event) {
		getFilmovi();

		event.preventDefault();
		return false;
    });
    
    zanrInput.on('change', function(event) {
		getFilmovi();

		event.preventDefault();
		return false;
    });
    
    trajanjeOdInput.on('change', function(event) {
		getFilmovi();

		event.preventDefault();
		return false;
    });
    
    trajanjeDoInput.on('change', function(event) {
		getFilmovi();

		event.preventDefault();
		return false;
    });
    
    distributerInput.on('change', function(event) {
		getFilmovi();

		event.preventDefault();
		return false;
    });
    
    zemljaPoreklaInput.on('change', function(event) {
		getFilmovi();

		event.preventDefault();
		return false;
    });
    
    godinaOdInput.on('change', function(event) {
		getFilmovi();

		event.preventDefault();
		return false;
    });
    
    godinaDoInput.on('change', function(event) {
		getFilmovi();

		event.preventDefault();
		return false;
    });
    
    $("#searchDugme").click(function (e){
    	getFilmovi();

        event.preventDefault();
        return false;
    });
    
});
