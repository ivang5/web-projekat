$(document).ready(function(){ 

	var filmID = window.location.search.slice(1).split('&')[0].split('=')[1];
	var FILM;
    var loggedInUserRole;
    var loggedInUserId;
	
    var filmButtons = $('#filmButtons');
    var btnIzmeniFilm;
    var btnObrisiFilm;
    var btnKupiKartu;
    
	//Navigacija
    var navigationButtons = $('#navigationButtons');
    var btnOdjava;
    var btnMojNalog;
    var btnKorisnici;
    var btnKupiKartu;
    var btnIzvestavanje;
    makeButtons();
    changeInterface();
    getFilm();
    
    
    function changeInterface() {
	      $.get('UserServlet', {'action': 'loggedInUserRole'}, function(data) {
	    	  console.log(data.status);
	    	  if (data.status == 'unauthenticated') {
	    		  $('#btnRegistracija').show();
	    		  $('#btnPrijava').show();
	    		  $('#btnOdjava').remove();
	    		  $('#btnMojNalog').remove();
	    		  $('#btnKorisnici').remove();
	    		  $('#btnKupiKartu').remove();
	    		  $('#btnIzvestavanje').remove();
	    		  
	    		  document.getElementById('inputNaziv').readOnly = true;
	    		  document.getElementById('inputReziser').readOnly = true; 
	    		  document.getElementById('inputGlumci').readOnly = true; 
	    		  document.getElementById('inputZanrovi').readOnly = true; 
	    		  document.getElementById('inputTrajanje').readOnly = true; 
	    		  document.getElementById('inputDistributer').readOnly = true; 
	    		  document.getElementById('inputZemljaPorekla').readOnly = true; 
	    		  document.getElementById('inputGodinaProizvodnje').readOnly = true;
	    		  document.getElementById('inputOpis').readOnly = true; 
	              return;
	    	  }
	    	  
	    	  loggedInUserRole = data.loggedInUserRole;

	    	  if (data.status == 'success') {
	    		  console.log(data.loggedInUserRole);
	    		  $('#btnRegistracija').hide();
	    		  $('#btnPrijava').hide();
	    		  if(data.loggedInUserRole == 'KORISNIK'){
	    			  navigationButtons.append(btnKupiKartu);
	    			  filmButtons.append(btnKupiKartu);
	    			  
		    		  document.getElementById('inputNaziv').readOnly = true;
		    		  document.getElementById('inputReziser').readOnly = true; 
		    		  document.getElementById('inputGlumci').readOnly = true; 
		    		  document.getElementById('inputZanrovi').readOnly = true; 
		    		  document.getElementById('inputTrajanje').readOnly = true; 
		    		  document.getElementById('inputDistributer').readOnly = true; 
		    		  document.getElementById('inputZemljaPorekla').readOnly = true; 
		    		  document.getElementById('inputGodinaProizvodnje').readOnly = true;
		    		  document.getElementById('inputOpis').readOnly = true; 
	    		  }
	           
	    		  if(data.loggedInUserRole == 'ADMINISTRATOR'){
	    			  navigationButtons.append(btnKorisnici);
	    			  navigationButtons.append(btnIzvestavanje);
	    			  filmButtons.append(btnObrisiFilm);
	    			  filmButtons.append(btnIzmeniFilm);
	    			  
		    		  document.getElementById('inputNaziv').readOnly = false;
		    		  document.getElementById('inputReziser').readOnly = false; 
		    		  document.getElementById('inputGlumci').readOnly = false; 
		    		  document.getElementById('inputZanrovi').readOnly = false; 
		    		  document.getElementById('inputTrajanje').readOnly = false; 
		    		  document.getElementById('inputDistributer').readOnly = false; 
		    		  document.getElementById('inputZemljaPorekla').readOnly = false; 
		    		  document.getElementById('inputGodinaProizvodnje').readOnly = false;
		    		  document.getElementById('inputOpis').readOnly = false; 
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
		
		btnIzmeniFilm = $('<button class="btn btn-primary">Izmeni film</button>').on('click', function(){
	    	if(loggedInUserRole == 'ADMINISTRATOR'){
		    	if($('#inputNaziv').val().length < 1) {
	    			alert("Naziv filma ne sme biti prazan!")
	    			return false;
	    		}
	    		if($('#inputTrajanje').val() < 1) {
	    			alert("Trajanje filma mora biti pozitivan broj!")
	    			return false;
	    		}
	    		if($('#inputDistributer').val().length < 2) {
	    			alert("Distributer mora sadrzati bar 2 karaktera!")
	    			return false;
	    		}
	    		if($('#inputZemljaPorekla').val().length < 2) {
	    			alert("Zemlja porekla mora sadrzati bar 2 karaktera!")
	    			return false;
	    		}
	    		if($('#inputGodinaProizvodnje').val() < 1) {
	    			alert("Godina proizvodnje filma mora biti pozitivan broj!")
	    			return false;
	    		}
				
				var params = {
					'action' : "update",
					'id' : filmID,
			        'naziv' : $('#inputNaziv').val(),
			        'reziser' : $('#inputReziser').val(),
			        'glumci' : $('#inputGlumci').val(),
			        'zanrovi' : $('#inputZanrovi').val(),
			        'trajanje' : $('#inputTrajanje').val(),
			        'distributer' : $('#inputDistributer').val(),
			        'zemljaPorekla' : $('#inputZemljaPorekla').val(),
			        'godinaProizvodnje' : $('#inputGodinaProizvodnje').val(),
			        'opis' : $('#inputOpis').val(),
				};
				
				
		        $.post('FilmServlet', params, function(data){
		            if (data.status == 'success') {
		            	alert("Film je uspesno izmenjen!");
		            	window.location.replace("filmovi.html");
		            }else {
		            	alert("Greska, film nije uspesno izmenjen!");
		            }
		        });
	    	}
	    });
	    
	    btnObrisiFilm = $('<button class="btn btn-danger">Obrisi film</button>').on('click', function(){
			if(loggedInUserRole == 'ADMINISTRATOR'){
	            var params = {
	        	    'id': filmID,
	                'action' : "delete"
	            };
	            $.post('FilmServlet', params, function(data){
	                if (data.status == 'success') {
  		            	alert("Film izbrisan");
  		                window.location.replace("filmovi.html");
	                }else{
	                	alert("Operacija neuspesna!");
	                }
	            });
			}
			
        });
	    
	    btnKorisnici = $('<li id="btnKorisnici"><a class="nav-link" href="korisnici.html">Korisnici</a></li>');
	    btnKupiKartu = $('<button type="button" id="btnKupiKartu" class="btn btn-success">Kupi kartu</button>').on('click', function(){
        	window.location.replace('kupovina.html');
        });
	    btnIzvestavanje = $('<li id="btnIzvestavanje"><a class="nav-link" href="izvestavanje.html">Izvestavanje</a></li>');
    }
    
    function getFilm(){

        var params = {
            'filmID' : filmID
        };
        
        console.log(filmID);

        $.get('FilmServlet', params, function(data){

            if (data.status == 'success') {
                FILM = data.trazeniFilm;

                $('#inputNaziv').val(FILM.naziv).trigger("change");
                $('#inputReziser').val(FILM.reziser).trigger("change");
                $('#inputGlumci').val(FILM.glumci).trigger("change");
                $('#inputZanrovi').val(FILM.zanrovi).trigger("change");
                $('#inputTrajanje').val(FILM.trajanje).trigger("change");
                $('#inputDistributer').val(FILM.distributer).trigger("change");
                $('#inputZemljaPorekla').val(FILM.zemljaPorekla).trigger("change");
                $('#inputGodinaProizvodnje').val(FILM.godinaProizvodnje).trigger("change");
                $('#inputOpis').val(FILM.opis).trigger("change");
                var filmObrisan = FILM.obrisan;
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
    
});