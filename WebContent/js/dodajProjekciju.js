$(document).ready(function(){
	
	var inputFilm = $('#inputFilm');
	var inputTipProjekcije = $('#inputTipProjekcije');
	var inputSala = $('#inputSala');
	var inputDatumVreme = $('#inputDatumVreme');
	var inputCena = $('#inputCena');
	
	var navigationButtons = $('#navigationButtons');
    var btnOdjava;
    var btnMojNalog;
    var btnKorisnici;
    makeButtons();
    changeInterface();
    
    
    function changeInterface() {
		$.get('UserServlet', {'action': 'loggedInUserRole'}, function(data) {
			console.log(data.status);
			if (data.status == 'unauthenticated') {
				window.location.replace('index.html');
				return;
			}
		
			if (data.status == 'success') {
				console.log(data.loggedInUserRole);
				if(data.loggedInUserRole == 'KORISNIK'){
					window.location.replace('index.html');
				}
				if(data.loggedInUserRole == 'ADMINISTRATOR'){
					getFilmovi();
					getSale();
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
        btnIzvestavanje = $('<li id="btnIzvestavanje"><a class="nav-link" href="izvestavanje.html">Izvestavanje</a></li>');
    }
    
    $('#btnDodajProjekciju').on('click', function(event) {    
    	if($('#inputFilm').val() == "" || $('#inputTipProjekcije').val() == "" || $('#inputSala').val() == "" || $('#inputDatumVreme').val() == "" || $('#inputCena').val() == ""){
            alert('Niste uneli sve potrebne informacije!');
            return;
        }
    	
    	var trenDatVr = new Date();
    	var datVr = new Date(inputDatumVreme.val());
    	var trenDatVrMS = trenDatVr.getTime();
    	var datVrMS = datVr.getTime();
    	if(datVrMS < trenDatVrMS) {
    		alert('Projekcija ne moze biti u proslosti!');
    		return;
    	}
    	
    	console.log('Trenutno vreme: ' + trenDatVrMS);
    	console.log('Projekcija vreme: ' + datVrMS);
    	
    	var datumVreme = dateFormat(new Date(inputDatumVreme.val()));
    	
    	$.ajaxSetup({async: false});
    	
    	var params = {
    			'action' : "add",
                'film' : inputFilm.val(),
                'tipProjekcije' : 'TIP' + inputTipProjekcije.val(),
                'sala' : inputSala.val(),
                'datumVreme' : datumVreme,
                'cenaKarte' : inputCena.val()
        };

    	$.post('ProjekcijaServlet', params, function(data){
    		if (data.status == 'success') {
            	alert('Projekcija je uspesno dodata!');
            	window.location.replace('index.html');
            }else{
                alert("Greska, projekcija nije uspesno dodata!");
            }
    
        });	
	});
    
    function getFilmovi() {
    	
    	var params = {
    		'nazivFilter' : '',
    		'zanrFilter' : '',
        	'trajanjeOdFilter' : '1',
        	'trajanjeDoFilter' : '5',
        	'distributerFilter' : '',
        	'zemljaPoreklaFilter' : '',
        	'godinaOdFilter' : '1950',
        	'godinaDoFilter' : '2020',
        };
    	
    	$.get('FilmServlet', params, function(data){
    		if (data.status == 'success') {
    			var filtriraniFilmovi = data.filtriraniFilmovi;
    			for(ff in filtriraniFilmovi) {
    				optionText = filtriraniFilmovi[ff].naziv;
    	            optionValue = filtriraniFilmovi[ff].naziv;
    				$('#inputFilm').append(`<option value="${optionValue}"> 
                            ${optionText} 
                            </option>`);
    			}
    		}
    	});
    }
    
    function getSale() {
    	$('#inputSala').empty();
    	var tipProjekcijeFilter = inputTipProjekcije.val();
    	
    	var params = {
    		'tipProjekcijeFilter' : tipProjekcijeFilter,
    	};
    	
    	$.get('SalaServlet', params, function(data){
    		if (data.status == 'success') {
    			var filtriraneSale = data.filtriraneSale;
    			for(fs in filtriraneSale) {
    				optionText = filtriraneSale[fs].naziv;
    	            optionValue = filtriraneSale[fs].naziv;
    				$('#inputSala').append(`<option value="${optionValue}"> 
                            ${optionText} 
                            </option>`);
    			}
    		}
    	});
    }
    
    inputTipProjekcije.on('change', function(event) {
    	getSale();

		event.preventDefault();
		return false;
    });
    
    function dateFormat(datum){
        let datumString = datum.getFullYear() + "-" + ("0" + (datum.getMonth() + 1)).slice(-2) + "-" + ("0" + datum.getDate()).slice(-2) + " " + ("0" + datum.getHours()).slice(-2) + ":" + ("0" + datum.getMinutes()).slice(-2) + ":" + ("0" + datum.getSeconds()).slice(-2)
        return datumString;
    }
    
});