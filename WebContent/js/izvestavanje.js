$(document).ready(function(){
    
    //Tabela
    var datumOdInput = $('#datumOdInput');
    var datumDoInput = $('#datumDoInput');
    
    var tabelaIzvestavanja = $('#tabelaIzvestavanja');
    
    var mySection = $('#mySection');
    
    var brojFiltriranihProjekcija;
    var ukupanBrojProjekcija = 0;
    var brojFiltriranihKarata = 0;
    var ukupanBrojKarata = 0;
    var ukupnaCenaFiltriranihKarata = 0;
    var ukupnaCenaSvihKarata = 0;
    
    //Navigacija
    var navigationButtons = $('#navigationButtons');
    var btnOdjava;
    var btnMojNalog;
    var btnKorisnici;
    makeButtons();
    changeInterface();
    
    
    function getIzvestaj() {   
    	
    	$.ajaxSetup({async: false});
    	
    	var paramsF = {
    		'nazivFilter' : '',
    		'zanrFilter' : '',
    		'trajanjeOdFilter' : '',
    		'trajanjeDoFilter' : '',
    		'distributerFilter' : '',
    		'zemljaPoreklaFilter' : '',
    		'godinaOdFilter' : '',
    		'godinaDoFilter' : '',
    	};
    	
    	$.get('FilmServlet', paramsF, function(data){
    		if (data.status == 'success') {
    			tabelaIzvestavanja.find('tbody').remove();
    			var filtriraniFilmovi = data.filtriraniFilmovi;
    			
    			for(ff in filtriraniFilmovi) {
    				
    				$.ajaxSetup({async: false});
    				
    				ukupnaCenaFiltriranihKarata = 0;
    				brojFiltriranihKarata = 0;
    				
    				var filmFilter = filtriraniFilmovi[ff].naziv;
    				var datOdFilter = $('#datumOdInput').val();
    				var datDoFilter = $('#datumDoInput').val();
    				var datOd = new Date(datOdFilter);
    				var datDo = new Date(datDoFilter);
    				var datOdMS = datOd.getTime();
    				var datDoMS = datDo.getTime();
    				
    				var paramsP = {
						'filmFilter' : filmFilter,
			    		'datumOdFilter' : datOdMS,
			    		'datumDoFilter' : datDoMS,
			    		'salaFilter' : '',
			    		'minCenaFilter' : '',
			    		'maxCenaFilter' : '',
			    		'tipProjekcijeFilter' : '',	
    				};
    				
    				$.get('ProjekcijaServlet', paramsP, function(data){
    		    		if (data.status == 'success') {
    		    			
    		    		    var filtriraneProjekcije = data.filtriraneProjekcije;
    		    		    brojFiltriranihProjekcija = filtriraneProjekcije.length;
    		    		    ukupanBrojProjekcija += filtriraneProjekcije.length;
    		    			
    		    			for(fp in filtriraneProjekcije) {
    		    				
    		    				$.ajaxSetup({async: false});
    		    				
    		    				var projekcijaID = filtriraneProjekcije[fp].id;
    		    				var paramsK = {
    		    					'projekcijaID' : projekcijaID,
    		    				};
    		    				
    		    				$.get('KartaServlet', paramsK, function(data){
    		    					if (data.status == 'success') {
    		    						
    		    						var filtriraneKarte = data.filtriraneKarte;
    		    						brojFiltriranihKarata += filtriraneKarte.length;
    		    						ukupanBrojKarata += filtriraneKarte.length;
    		    						console.log("BROJ FILTRIRANIH KARATA: " + brojFiltriranihKarata);
    		    						
    		    						for(fk in filtriraneKarte) {
    		    							ukupnaCenaFiltriranihKarata += filtriraneKarte[fk].projekcija.cenaKarte;
    		    							ukupnaCenaSvihKarata += filtriraneKarte[fk].projekcija.cenaKarte;
    		    						}
    		    					}
    		    				});
    		    			}
    		    		}
    		    	});
    				tabelaIzvestavanja.append(
						'<tbody>' +
			                '<tr>' + 
			                  '<td align="left"><a href="film.html?id=' + filtriraniFilmovi[ff].id + '">' + filtriraniFilmovi[ff].naziv + '</a></td>' + 
			                  '<td align="left">' + brojFiltriranihProjekcija + '</td>' +
			                  '<td align="left">' + brojFiltriranihKarata + '</td>' +
			                  '<td align="left">' + ukupnaCenaFiltriranihKarata + '</td>' +
			                '</tr>' +
		                '</tbody>'
    				)
    					
    			}
    			$('#tabelaIzvestavanja tr:last').after(
					'<tr>' + 
		              '<td align="left">' + 'Ukupno' + '</td>' + 
		              '<td align="left">' + ukupanBrojProjekcija + '</td>' +
		              '<td align="left">' + ukupanBrojKarata + '</td>' +
		              '<td align="left">' + ukupnaCenaSvihKarata + '</td>' +
		            '</tr>'
				)
    		}
    	});
    }
    
    function changeInterface() {
		$.get('UserServlet', {'action': 'loggedInUserRole'}, function(data) {
			console.log(data.status);
			if (data.status == 'unauthenticated') {
				window.location.replace('index.html');
			}
		
			if (data.status == 'success') {
				$('#btnRegistracija').hide();
				$('#btnPrijava').hide();
				console.log(data.loggedInUserRole);
				
				if(data.loggedInUserRole == 'KORISNIK'){
					alert('Greska, nije vam dozovoljen pristup ovoj stranici!');
		            window.location.replace("index.html");
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
        btnIzvestavanje = $('<li id="btnIzvestavanje"><a class="nav-link" href="#">Izvestavanje</a></li>');
    }
    
//    datumOdInput.on('change', function(event) {
//    	getIzvestaj();
//
//		event.preventDefault();
//		return false;
//    });
//    
//    datumDoInput.on('change', function(event) {
//    	getIzvestaj();
//
//		event.preventDefault();
//		return false;
//    });
    
    $("#searchDugme").click(function (e){
    	ukupanBrojProjekcija = 0;
    	brojFiltriranihKarata = 0;
    	ukupanBrojKarata = 0;
    	ukupnaCenaFiltriranihKarata = 0;
    	ukupnaCenaSvihKarata = 0;
    	getIzvestaj();

        event.preventDefault();
        return false;
    });
});