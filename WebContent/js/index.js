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
    var filmInput = $('#filmInput');
    var datumOdInput = $('#datumOdInput');
    var vremeOdInput = $('#vremeOdInput');
    var datumDoInput = $('#datumDoInput');
    var vremeDoInput = $('#vremeDoInput');
    var salaInput = $('#salaInput');
    var minCenaInput = $('#minCenaInput');
    var maxCenaInput = $('#maxCenaInput');
    var tipProjekcije = $('#tipProjekcije');
    
    var tabelaProjekcija = $('#tabelaProjekcija');
    
    var mySection = $('#mySection');
    var btnDodajProjekciju;
    
    //Navigacija
    var navigationButtons = $('#navigationButtons');
    var btnOdjava;
    var btnMojNalog;
    var btnKorisnici;
    makeButtons();
    changeInterface();
    getProjekcije();
    
    
    function getProjekcije() {
    	var filmFilter = filmInput.val();
    	var today = new Date();
    	var dd = String(today.getDate()).padStart(2, '0');
    	var mm = String(today.getMonth() + 1).padStart(2, '0');
    	var yyyy = today.getFullYear();
    	today = yyyy + '-' + mm + '-' + dd;
    	if(datumOdInput.val() == "" || vremeOdInput.val() == "") {
    		var datumOdFilter = today + " 00:00:00";
    		var datOd = new Date(datumOdFilter);
    		var datOdMS = datOd.getTime();
    	}else {
    		var datumOdFilter = datumOdInput.val() + " " + vremeOdInput.val() + ":00";
    		var datOd = new Date(datumOdFilter);
    		var datOdMS = datOd.getTime();
    	}
    	if(datumDoInput.val() == "" || vremeDoInput.val() == "") {
    		var datumDoFilter = today + " 23:59:59";
    		var datDo = new Date(datumDoFilter);
    		var datDoMS = datDo.getTime();
    	}else {
    		var datumDoFilter = datumDoInput.val() + " " + vremeDoInput.val() + ":00";
    		var datDo = new Date(datumDoFilter);
    		var datDoMS = datDo.getTime();
    	}
    	var salaFilter = salaInput.val();
    	var minCenaFilter = minCenaInput.val();
    	var maxCenaFilter = maxCenaInput.val();
    	var tipProjekcijeFilter = tipProjekcije.val();
    	
    	var params = {
    		'filmFilter' : filmFilter,
    		'datumOdFilter' : datOdMS,
    		'datumDoFilter' : datDoMS,
    		'salaFilter' : salaFilter,
    		'minCenaFilter' : minCenaFilter,
    		'maxCenaFilter' : maxCenaFilter,
    		'tipProjekcijeFilter' : tipProjekcijeFilter,
    	};
    	
    	console.log(params);
    	$.get('ProjekcijaServlet', params, function(data){
    		if (data.status == 'success') {
    			tabelaProjekcija.find('tbody').remove();
    			
    		    var filtriraneProjekcije = data.filtriraneProjekcije;
    			console.log(data.filtriraneProjekcije);
    			for(fp in filtriraneProjekcije) {
    				tabelaProjekcija.append(
						'<tbody>' +
			                '<tr>' + 
			                  '<td align="left"><a href="film.html?id=' + filtriraneProjekcije[fp].film.id + '">' + filtriraneProjekcije[fp].film.naziv + '</a></td>' + 
			                  '<td align="left"><a href="projekcija.html?id=' + filtriraneProjekcije[fp].id + '">' + dateFormat(new Date(filtriraneProjekcije[fp].datumVreme)) + '</a></td>' + 
			                  '<td align="left">' + filtriraneProjekcije[fp].tipProjekcije.slice(3,5) + '</td>' +
			                  '<td align="left">' + filtriraneProjekcije[fp].sala.naziv + '</td>' +
			                  '<td align="left">' + filtriraneProjekcije[fp].cenaKarte + '</td>' +
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
					mySection.append(btnDodajProjekciju);
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
        
        btnDodajProjekciju = $('<button type="button" id="novaProjekcija" class="btn btn-light">Dodaj projekciju</button>').on('click', function(){
        	window.location.replace('dodajProjekciju.html');
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
    
    filmInput.on('change', function(event) {
    	getProjekcije();
    	
    	event.preventDefault();
    	return false;
    });
    
    datumOdInput.on('change', function(event) {
    	getProjekcije();

		event.preventDefault();
		return false;
    });
    
    datumDoInput.on('change', function(event) {
    	getProjekcije();

		event.preventDefault();
		return false;
    });
    
    salaInput.on('change', function(event) {
    	getProjekcije();
    	
    	event.preventDefault();
    	return false;
    });
    
    minCenaInput.on('keyup', function(event) {
    	getProjekcije();
    	
    	event.preventDefault();
    	return false;
    });
    
    minCenaInput.on('keyup', function(event) {
    	getProjekcije();
    	
    	event.preventDefault();
    	return false;
    });
    
    tipProjekcije.on('change', function(event) {
    	getProjekcije();

		event.preventDefault();
		return false;
    });
    
    $("#searchDugme").click(function (e){
    	getProjekcije();

        event.preventDefault();
        return false;
    });
    
    function dateFormat(datum){
        let datumString = datum.getFullYear() + "-" + ("0" + (datum.getMonth() + 1)).slice(-2) + "-" + ("0" + datum.getDate()).slice(-2) + " " + ("0" + datum.getHours()).slice(-2) + ":" + ("0" + datum.getMinutes()).slice(-2)
        return datumString;
    }
    
});