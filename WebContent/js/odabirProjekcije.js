$(document).ready(function(){ 

	var filmID = window.location.search.slice(1).split('&')[0].split('=')[1];
	var FILM;
	var nazivFilma;
	var projekcijaID;
    var loggedInUserRole;
    var loggedInUserId;
    
    var tabelaProjekcija = $('#tabelaProjekcija');
    var mySection = $('#mySection');
    var btnNastaviKupovinu;
    
    var selektovanaProjekcija;
    
    //Navigacija
    var navigationButtons = $('#navigationButtons');
    var btnOdjava;
    var btnMojNalog;
    makeButtons();
    changeInterface();
    getFilm();
    
    
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
		    		  navigationButtons.append(btnMojNalog);
		    		  navigationButtons.append(btnOdjava);
		    		  mySection.append(btnNastaviKupovinu);
	    		  }
	           
	    		  if(data.loggedInUserRole == 'ADMINISTRATOR'){
	    			  window.location.replace('index.html');
	    		  }    	    		    
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
		
		btnNastaviKupovinu = $('<button type="button" id="nastaviKupovinu" class="btn btn-light">Nastavi kupovinu</button>').on('click', function(){
			console.log("selektovana projekcija: " + selektovanaProjekcija)
			if(selektovanaProjekcija != null) {
				let url = 'kupovina.html?id=' + projekcijaID;
	        	window.location.replace(url);
	        	return;
			}else {
				alert("Nije selektovan nijedan film!")
			}
        });
	}
	
	function getFilm(){

        var params = {
            'filmID' : filmID
        };
        
        console.log(filmID);

        $.get('FilmServlet', params, function(data){
        	async: false
            if (data.status == 'success') {
                FILM = data.trazeniFilm;
                nazivFilma = FILM.naziv;

                $('#podnaslov').html('<a id="filmLink" href="film.html?id=' + FILM.id + '">' + 'Izabrani film: ' + FILM.naziv + '</a>');
            }

        }).done(getProjekcije);

    }
	
	function getProjekcije() {
    	var today = new Date();
    	var ss = String(today.getSeconds());
    	var min = String(today.getMinutes());
    	var hh = String(today.getHours());
    	var dd = String(today.getDate()).padStart(2, '0');
    	var mm = String(today.getMonth() + 1).padStart(2, '0');
    	var yyyy = today.getFullYear();
    	today = yyyy + '-' + mm + '-' + dd + ' ' + hh + ':' + min + ':' + ss;
    	var datumOdFilter = today;
    	var datumDoFilter = "3000-12-31 23:59:59";
    	var salaFilter = "";
    	var minCenaFilter = "200";
    	var maxCenaFilter = "1500";
    	var tipProjekcijeFilter = "";
    	
    	var params = {
    		'filmFilter' : nazivFilma,
    		'datumOdFilter' : datumOdFilter, 
    		'datumDoFilter' : datumDoFilter,
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
			                '<tr id="row' + filtriraneProjekcije[fp].id+'" class="clickable-row">' +
			                  '<td align="left"><a href="projekcija.html?id=' + filtriraneProjekcije[fp].id + '">' + dateFormat(new Date(filtriraneProjekcije[fp].datumVreme)) + '</a></td>' + 
			                  '<td align="left">' + filtriraneProjekcije[fp].tipProjekcije.slice(3,5) + '</td>' +
			                  '<td align="left">' + filtriraneProjekcije[fp].sala.naziv + '</td>' +
			                  '<td align="left">' + filtriraneProjekcije[fp].cenaKarte + '</td>' +
			                '</tr>' +
		                '</tbody>'		
    				)
    			}
    			selectedRow(table = document.getElementById("tabelaProjekcija"));
    			selectRowFromProjekcijaId();
    		}
    	});
    }
	
	function selectedRow(table){
        var index;
        for(var i = 1; i < table.rows.length; i++) {
            table.rows[i].onclick = function() {
                 // remove the background from the previous selected row
                if(typeof index !== "undefined") {
                    table.rows[index].classList.toggle("selectedRow");
                }
                // get the selected row index
                index = this.rowIndex;
                // add class selected to the row
                this.classList.toggle("selectedRow");
                
                selektovanaProjekcija = this;
                console.log(this);
                
                projekcijaIzTabele = this.innerHTML.slice(45,47);
                projekcijaID = projekcijaIzTabele.replace('"','');
                console.log("PROJEKCIJA: " + projekcijaID);
             };
        }
    }
	
	function selectRowFromProjekcijaId(){
	    if(projekcijaID != null){
	    	let red = document.getElementById("row" + projekcijaID);
	    	if(red != null) {
	    		red.click();
	    	}  
	    }
	}
	
	function dateFormat(datum){
        let datumString = datum.getFullYear() + "-" + ("0" + (datum.getMonth() + 1)).slice(-2) + "-" + ("0" + datum.getDate()).slice(-2) + " " + ("0" + datum.getHours()).slice(-2) + ":" + ("0" + datum.getMinutes()).slice(-2)
        return datumString;
    }
    
});