$(document).ready(function(){    
    
	var korisnikID = window.location.search.slice(1).split('&')[0].split('=')[1];
    var KORISNIK;
    var loggedInUserRole;
    var loggedInUserId;
	
    //Navigacija
    var navigationButtons = $('#navigationButtons');
    var nalogOperacije = $('#nalogOperacije');
    var btnObrisiNalog;
    var btnOdjava;
    var btnMojNalog;
    var btnKorisnici;
    var btnKupiKartu;
    var btnProjekcije;
    makeButtons();
    buttonActions();
    changeInterface();
    getUser();
    
    
    function changeInterface() {
    	      $.get('UserServlet', {'action': 'loggedInUserRole'}, function(data) {
    	    	  loggedInUserRole = data.loggedInUserRole;
    	    	  console.log(data.status);
    	    	  if (data.status == 'unauthenticated') {
    	    		  window.location.replace('index.html');
    	    	  }

    	    	  if (data.status == 'success') {
    	    		  console.log(data.loggedInUserRole);
    	    		  if(data.loggedInUserRole == 'KORISNIK'){
    	    			  navigationButtons.append(btnKupiKartu);
    	    		  }
		           
    	    		  if(data.loggedInUserRole == 'ADMINISTRATOR'){
    	    			  navigationButtons.append(btnKorisnici);
    	    			  navigationButtons.append(btnProjekcije);
    	    			  navigationButtons.append(btnIzvestavanje);
    	    			  nalogOperacije.append(btnObrisiNalog);
    	    			  labelRole = $('<label class="myLabelText">Uloga</label>');
    	    			  cbRole = $('<select class="form-control md-form"" id="cbRole"><option value="none" selected disabled hidden>Izaberite ulogu</option><option value="ADMINISTRATOR">Administrator</option><option value="KORISNIK">Korisnik</option></select>');
    	    			  $('#userFields').append(labelRole);
    	    			  $('#userFields').append(cbRole);
    	    		  }    	    		    
    	    		  navigationButtons.append(btnMojNalog);
    	    		  navigationButtons.append(btnOdjava);
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
    	
    	btnObrisiNalog = $('<button class="btn btn-danger">Obrisi nalog</button>').on('click', function(){
    		$.get('UserServlet', {'action' : 'loggedInUserId'}, function(data){
    			loggedInUserId = data.loggedInUserId;
    			if(korisnikID == loggedInUserId){
        			alert("Greska! Ne mozete izbrisati svoj nalog!")
        			let url = 'profil.html?id=' + data.loggedInUserId;
            		window.location.replace(url);
            		return;
        		}
    			if(loggedInUserRole == 'ADMINISTRATOR'){
  		            var params = {
  		        	    'id': korisnikID,
  		                'action' : "delete"
  		            };
  		            $.post('UserServlet', params, function(data){
  		                if (data.status == 'success') {
	  		            	alert("Korisnik izbrisan");
	  		                window.location.replace("korisnici.html");
  		                }else{
  		                	alert("Operacija neuspesna!");
  		                }
  		            });
    			}
    		});
			
        });
    	
    	btnKorisnici = $('<li id="btnKorisnici"><a class="nav-link" href="korisnici.html">Korisnici</a></li>');
        btnKupiKartu = $('<li id="btnKupiKartu"><a class="nav-link" href="kupovina.html">Kupi kartu</a></li>');
        btnProjekcije = $('<li id="btnProjekcije"><a class="nav-link" href="projekcije.html">Projekcije</a></li>');
        btnIzvestavanje = $('<li id="btnIzvestavanje"><a class="nav-link" href="izvestavanje.html">Izvestavanje</a></li>')
    }
    
    
    function buttonActions() {
    	$('#btnChangeUser').click(function (e) {
    		if($('#inputUsername').val().length < 3) {
    			alert("Korisnicko ime mora da sadrzi minimum 3 karaktera!")
    			return false;
    		}
    		
			let uloga = $('#cbRole').val();
			var params = {
				'action' : "update",
				'id' : korisnikID,
		        'korisnickoIme' : $('#inputUsername').val(),
		        'uloga' : (uloga != null? uloga : 'KORISNIK')
			};
			
			if(loggedInUserRole == 'KORISNIK' && KORISNIK.obrisan == 'true'){
		        alert("Trenutno nije moguce obaviti ovu operaciju!");
		        return;
			}else{
		        $.post('UserServlet', params, function(data){
		            if (data.status == 'success') {
		            	alert("Profil je uspesno izmenjen!");
		            	if(loggedInUserRole == 'ADMINISTRATOR'){
		            		window.location.replace("korisnici.html");
		            	}else{
		            		window.location.replace("index.html");
		            	}
		            	return;
		            }else {
		            	alert("Greska, profil nije uspesno izmenjen!");
		            }
		        });
			}
    	});
    	
    	$('#btnChangePass').click(function (e) {
    		if($('#inputOldPass').val() == "" || $('#inputNewPass').val() == "" || $('#inputNewPassRepeat').val() == "") {
    			alert("Sva polja moraju biti popunjena!");
    			return;
    		}else if ($('#inputNewPass').val().length < 3) {
    			alert("Lozinka ime mora da sadrzi minimum 3 karaktera!");
    			return;
			}else if ($('#inputNewPass').val() != $('#inputNewPassRepeat').val()) {
				alert("Nove lozinke se moraju poklapati!");
				return;
			}
    		
    		var params = {
    				'action' : "update",
    				'id' : korisnikID,
    				'lozinka' : $('#inputNewPass').val(),
    				'uloga' : loggedInUserRole
    		};
    		
    		if(loggedInUserRole == 'KORISNIK' && KORISNIK.obrisan == 'true'){
		        alert("Trenutno nije moguce obaviti ovu operaciju!");
		        return;
    		}else{
		        $.post('UserServlet', params, function(data){
		        	console.log(data.status);
		            if (data.status == 'success') {
		            	alert("Lozinka je uspesno izmenjena!");
		            	if(loggedInUserRole == 'ADMINISTRATOR'){
		            		window.location.replace("korisnici.html");
		            	}else{
		            		window.location.replace("index.html");
		            	}
		            	return;
		            }else {
		            	alert("Greska, lozinka nije uspesno izmenjena!");
		            }
		        });
			}
    	});
    }
    
    
    function getUser(){

        var params = {
            'korisnikID' : korisnikID
        };

        $.get('UserServlet', params, function(data){

            if (data.status == 'success') {
                KORISNIK = data.trazeniKorisnik;

                $('#inputUsername').val(KORISNIK.korisnickoIme).trigger("change");
                $('#inputDate').val(dateFormat(new Date(KORISNIK.datumRegistracije)).split(" ")[0]).trigger("change");
                var korisnikObrisan = KORISNIK.obrisan;
                if (korisnikObrisan) {
                	$('#inputStatus').val("obrisan").trigger("change");
                } else {
                	$('#inputStatus').val("aktivan").trigger("change");
                }
                
            }

        });

    }
    
    
    function dateFormat(datum){
        let datumString = datum.getFullYear() + "-" + ("0" + (datum.getMonth() + 1)).slice(-2) + "-" + ("0" + datum.getDate()).slice(-2) + " " + ("0" + datum.getHours()).slice(-2) + ":" + ("0" + datum.getMinutes()).slice(-2) + ":" + ("0" + datum.getSeconds()).slice(-2)
        return datumString;
    }
    
});