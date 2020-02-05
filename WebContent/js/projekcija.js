$(document).ready(function(){ 

	var projekcijaID = window.location.search.slice(1).split('&')[0].split('=')[1];
	var PROJEKCIJA;
    var loggedInUserRole;
    var loggedInUserId;
	
    var projekcijaButtons = $('#projekcijaButtons');
    var btnKupiKartu;
    
    var tabelaKarata = $('#tabelaKarata');
    
	//Navigacija
    var navigationButtons = $('#navigationButtons');
    var btnOdjava;
    var btnMojNalog;
    var btnKorisnici;
    var btnIzvestavanje;
    
    makeButtons();
    changeInterface();
    getProjekcija();
	getKarte();
    
    
    function changeInterface() {
	      $.get('UserServlet', {'action': 'loggedInUserRole'}, function(data) {
	    	  console.log(data.status);
	    	  if (data.status == 'unauthenticated') {
	    		  $('#btnRegistracija').show();
	    		  $('#btnPrijava').show();
	    		  $('#btnOdjava').remove();
	    		  $('#btnMojNalog').remove();
	    		  $('#btnKorisnici').remove();
	    		  $('#btnIzvestavanje').remove();
	    		  $('#btnObrisiProjekciju').remove();
	    		  $('#sekcija').remove();
	    	  }
	    	  
	    	  loggedInUserRole = data.loggedInUserRole;

	    	  if (data.status == 'success') {
	    		  console.log(data.loggedInUserRole);
	    		  $('#btnRegistracija').hide();
	    		  $('#btnPrijava').hide();
	    		  if(data.loggedInUserRole == 'KORISNIK'){
	    			  projekcijaButtons.append(btnKupiKartu);
	    			  $('#btnObrisiProjekciju').remove();
	    			  $('#sekcija').remove();
	    		  }
	           
	    		  if(data.loggedInUserRole == 'ADMINISTRATOR'){
	    			  navigationButtons.append(btnKorisnici);
	    			  navigationButtons.append(btnIzvestavanje);
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
			window.location.replace('index.html');
			return false;
		});
		
		btnMojNalog = $('<li id="btnMojNalog"><a class="nav-link" href="#">Moj nalog</a></li>').on('click', function(){
			let param = { 'action' : "loggedInUserId"}
			$.get('UserServlet', param, function(data) {
				console.log(loggedInUserId);
				if (data.status == 'success') {
					let url = 'profil.html?id=' + data.loggedInUserId;
					window.location.replace(url);
					return;
				}
			});
		});
	    
	    btnKorisnici = $('<li id="btnKorisnici"><a class="nav-link" href="korisnici.html">Korisnici</a></li>');
	    btnKupiKartu = $('<button type="button" id="btnKupiKartu" class="btn btn-success">Kupi kartu</button>').on('click', function(){
	    	let url = 'kupovina.html?id=' + projekcijaID;
        	window.location.replace(url);
        });
	    btnIzvestavanje = $('<li id="btnIzvestavanje"><a class="nav-link" href="izvestavanje.html">Izvestavanje</a></li>');
    }
    
    function getProjekcija(){

        var params = {
            'projekcijaID' : projekcijaID
        };
        
        console.log(projekcijaID);

        $.get('ProjekcijaServlet', params, function(data){

            if (data.status == 'success') {
                PROJEKCIJA = data.trazenaProjekcija;

                $('#inputFilm').val(PROJEKCIJA.film.naziv).trigger("change");
                $('#inputDatumVreme').val(dateFormat(new Date(PROJEKCIJA.datumVreme)).split(" ")[0]).trigger("change");
                $('#inputTipProjekcije').val(PROJEKCIJA.tipProjekcije.slice(3,5)).trigger("change");
                $('#inputSala').val(PROJEKCIJA.sala.naziv).trigger("change");
                $('#inputCena').val(PROJEKCIJA.cenaKarte).trigger("change");
                var projekcijaObrisana = PROJEKCIJA.obrisana;
            }

        });

    }
    
    $('#btnPotvrdiBrisanje').on('click', function(){
    	if(loggedInUserRole == 'ADMINISTRATOR'){
            var params = {
        	    'id': projekcijaID,
                'action' : "delete"
            };
            $.post('ProjekcijaServlet', params, function(data){
                if (data.status == 'success') {
	            	alert("Projekcija izbrisana");
	                window.location.replace("index.html");
                }else{
                	alert("Operacija neuspesna!");
                }
            });
		}
    });
    
    function getKarte(){
    	var params = {
    		'projekcijaID' : projekcijaID
    	};
    	
    	$.get('KartaServlet', params, function(data){
    		if (data.status == 'success') {
    			tabelaKarata.find('tbody').remove();
    			
    		    var filtriraneKarte = data.filtriraneKarte;
    			for(fk in filtriraneKarte) {
    				tabelaKarata.append(
						'<tbody>' +
			                '<tr>' + 
			                  '<td align="left"><a href="karta.html?id=' + filtriraneKarte[fk].id + '">' + dateFormat(new Date(filtriraneKarte[fk].datumVremeProdaje)) + '</a></td>' +
			                  '<td align="left"><a href="profil.html?id=' + filtriraneKarte[fk].korisnik.id + '">' + filtriraneKarte[fk].korisnik.korisnickoIme + '</a></td>' +
			                '</tr>' +
		                '</tbody>'		
    				)
    			}
    		}
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
    
    function dateFormat(datum){
        let datumString = datum.getFullYear() + "-" + ("0" + (datum.getMonth() + 1)).slice(-2) + "-" + ("0" + datum.getDate()).slice(-2) + " " + ("0" + datum.getHours()).slice(-2) + ":" + ("0" + datum.getMinutes()).slice(-2) + ":" + ("0" + datum.getSeconds()).slice(-2)
        return datumString;
    }
    
});