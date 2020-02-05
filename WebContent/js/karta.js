$(document).ready(function(){ 

	var kartaID = window.location.search.slice(1).split('&')[0].split('=')[1];
	var KARTA;
    var loggedInUserRole;
    var loggedInUserId;
	
    var kartaButtons = $('#kartaButtons');
    
	//Navigacija
    var navigationButtons = $('#navigationButtons');
    var btnOdjava;
    var btnMojNalog;
    var btnKorisnici;
    var btnIzvestavanje;
    makeButtons();
    changeInterface();
    getKarta();
    
    
    function changeInterface() {
	      $.get('UserServlet', {'action': 'loggedInUserRole'}, function(data) {
	    	  console.log(data.status);
	    	  if (data.status == 'unauthenticated') {
	    		  window.location.replace('index.html');
	              return;
	    	  }
	    	  
	    	  loggedInUserRole = data.loggedInUserRole;

	    	  if (data.status == 'success') {
	    		  console.log(data.loggedInUserRole);
	    		  if(data.loggedInUserRole == 'KORISNIK'){
	    			  $('#labelKupac').remove();
	    			  $('#inputKupac').remove();
	    			  $('#btnObrisiFilm').remove();
	    		  }
	           
	    		  if(data.loggedInUserRole == 'ADMINISTRATOR'){
	    			  navigationButtons.append(btnKorisnici);
	    			  navigationButtons.append(btnIzvestavanje);
//	    			  $('#userFields').append($('#labelKupac'));
//	    			  $('#userFields').append($('#inputKupac'));
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
	    btnIzvestavanje = $('<li id="btnIzvestavanje"><a class="nav-link" href="izvestavanje.html">Izvestavanje</a></li>');
    }
    
    function getKarta(){

        var params = {
            'kartaID' : kartaID
        };
        
        console.log(kartaID);

        $.get('KartaServlet', params, function(data){

            if (data.status == 'success') {
                KARTA = data.trazenaKarta;

                $('#inputFilm').val(KARTA.projekcija.film.naziv).trigger("change");
                $('#inputDatumVreme').val(dateFormat(new Date(KARTA.projekcija.datumVreme)).split(" ")[0]).trigger("change");
                $('#inputTipProjekcije').val(KARTA.projekcija.tipProjekcije.slice(3,5)).trigger("change");
                $('#inputSala').val(KARTA.projekcija.sala.naziv).trigger("change");
                $('#inputSediste').val(KARTA.sediste.redniBroj).trigger("change");
                $('#inputCena').val(KARTA.projekcija.cenaKarte).trigger("change");
                $('#inputKupac').val(KARTA.korisnik.korisnickoIme).trigger("change");
            }

        });

    }
    
    $('#btnPotvrdiBrisanje').on('click', function(){
    	if(loggedInUserRole == 'ADMINISTRATOR'){
            var params = {
        	    'id': kartaID,
                'action' : "delete"
            };
            $.post('KartaServlet', params, function(data){
                if (data.status == 'success') {
	            	alert("Karta izbrisana");
	                window.location.replace("korisnici.html");
                }else {
                	alert("Operacija neuspesna!");
                }
            });
		}
    });
    
    function dateFormat(datum){
        let datumString = datum.getFullYear() + "-" + ("0" + (datum.getMonth() + 1)).slice(-2) + "-" + ("0" + datum.getDate()).slice(-2) + " " + ("0" + datum.getHours()).slice(-2) + ":" + ("0" + datum.getMinutes()).slice(-2) + ":" + ("0" + datum.getSeconds()).slice(-2)
        return datumString;
    }
    
});