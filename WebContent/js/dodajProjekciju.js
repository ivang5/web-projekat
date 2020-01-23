$(document).ready(function(){
	
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
    	var inputFilm = $('#inputFilm');
    	var inputTipProjekcije = $('#inputTipProjekcije');
    	var inputSala = $('#inputSala');
    	var inputDatumVreme = $('#inputDatumVreme');
    	var inputCena = $('#inputCena');
    	
    	if($('#inputFilm').val() == "" || $('#inputTipProjekcije').val() == "" || $('#inputSala').val() == "" || $('inputDatumVreme').val() == "" || $('inputCena').val() == ""){
            alert('Niste uneli sve potrebne informacije!');
            return;
        }
    	
    	var params = {
                'film' : inputNaziv.val(),
                'tipProjekcije' : inputReziser.val(),
                'sala' : inputGlumci.val(),
                'datumVreme' : inputZanrovi.val(),
                'cenaKarte' : inputTrajanje.val(),
        };
    	
    	//AJAX ZAHTEV --> PRVO ODRADITI PROJEKCIJA SERVLET!
    	
    	
	});
    
});