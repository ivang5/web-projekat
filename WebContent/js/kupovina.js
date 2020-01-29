$(document).ready(function(){ 

	var projekcijaID = window.location.search.slice(1).split('&')[0].split('=')[1];
	var PROJEKCIJA;
	var loggedInUserRole;
    var loggedInUserId;
    
    var selektovanaSedista = [];
    var kartaSala;
    var karteSedista = [];
	
    //Navigacija
    var navigationButtons = $('#navigationButtons');
    var btnOdjava;
    var btnMojNalog;
    makeButtons();
    changeInterface();
    getProjekcija();
    pronadjiSelektovanaSedista();
    $('#trecaFaza').hide();
    pronadjiZauzetaSedista();
    
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
	}
	
	$('#nastaviKupovinu').on('click', function(event) {
		if(selektovanaSedista.length > 1) {
			var ok = false;
			var okBrojac = 1;
			for(var ss of selektovanaSedista) {
				if(ss == 10 || ss == 20 || ss == 30 || ss == 40 || ss == 50 || ss == 60 || ss == 70 || ss == 80) {
					ok = false;
					for(var a of selektovanaSedista) {
						if(a == ss-1) {
							ok = true;
						}
					}
					if(ok == true){
						okBrojac+=1;
					}
				}else if(ss == 1 || ss == 11 || ss == 21 || ss == 31 || ss == 41 || ss == 51 || ss == 61 || ss == 71) {
					ok = false;
					for(var a of selektovanaSedista) {
						if(a == ss+1) {
							ok = true;
						}
					}
					if(ok == true){
						okBrojac+=1;
					}
				}else {
					ok = false;
					for(var a of selektovanaSedista) {
						if(a == ss-1 || a == ss+1) {
							ok = true;
						}
					}
					if(ok == true){
						okBrojac+=1;
					}
				}
			}
			console.log("broj selektovanih sedista: " + selektovanaSedista.length);
			console.log("brojac: " + okBrojac);
			if(okBrojac == selektovanaSedista.length) {
				$('#drugaFaza').hide();
				$('#trecaFaza').show();
				getProjekcija();
			}else {
				$('#staticBackdrop').modal();
			}
		}else if(selektovanaSedista.length > 0) {
			$('#drugaFaza').hide();
			$('#trecaFaza').show();
			getProjekcija();
		}else {
			alert('Niste selektovali nijedno sediste!');
		}
	});
	
	$('#btnNastaviSvakako').on('click', function(event) {
		$('#drugaFaza').hide();
		$('#trecaFaza').show();
		getProjekcija();
		$('#staticBackdrop').modal('hide');
	})
	
	$('#dugmeOdustani').on('click', function(event) {
		window.location.replace('index.html');
	});
	
	$('#kupi').on('click', function(event) {
		brojac = 0;
		greska = false;
		for(var ks of karteSedista) {
			var params = {
	    			'action' : "add",
	                'projekcijaID' : projekcijaID,
	                'sediste' : ks,
	        };
			
			$.post('KartaServlet', params, function(data){
	            if (data.status == 'success') {
	            	++brojac;
	            }else{
	                alert("Greska, karta nije uspesno kupljena!");
	                greska = true;
	            }
	    
	        });
		}
		if(brojac > 1) {
			if(greska == true) {
				alert('Ostale karte su uspesno kupljene!');
			}else {
				alert('Karte su uspesno kupljene!');
			}
		}else {
			if(greska == true) {
				alert('Druga karta je uspesno kupljena!');
			}else {
				alert('Karta je uspesno kupljena!');
			}
		}
		window.location.replace("index.html");
	});
	
	$('#dugmeOdustani1').on('click', function(event) {
		window.location.replace('index.html');
	});
	
	function pronadjiSelektovanaSedista() {
		$("#odabirSedista :input:checkbox").on('change', function() {
			if($("#odabirSedista :input:checkbox").is(':checked')){
				$("#odabirSedista").find("label[for='"+$(this).attr("id")+"']").css('background-color', '#008c00');
				var vecDodato = false;
				var trenutnoSediste = $(this).attr("id");
				for(var ss of selektovanaSedista) {
					if(ss == trenutnoSediste) {
						vecDodato = true;
					}
				}
				if(vecDodato == false) {
					selektovanaSedista.push($(this).attr("id"));
				}else {
					selektovanaSedista.splice(selektovanaSedista.indexOf($(this).attr("id")), 1 );
					$("#odabirSedista").find("label[for='"+$(this).attr("id")+"']").css('background-color', '#343a40');
				}	
	        }else{
	        	$("#odabirSedista").find("label[for='"+$(this).attr("id")+"']").css('background-color', '#343a40');
	        	selektovanaSedista.splice(selektovanaSedista.indexOf($(this).attr("id")), 1 );
	        }
	        $('#odabirSedista :input:checkbox').not(this).prop('checked', false);
		});
	}
	
	function pronadjiZauzetaSedista() {
		$.ajaxSetup({async: false});
	      var params = {
	          'proveraZauzetihSedista' : "proveraZauzetihSedista",
	          'projekcijaID' : projekcijaID,
	          'kartaID' : '0'
	      };
	      var listaZauzetihSedista;
	      $.get('ProjekcijaServlet', params, function(data) {

	          if (data.status == 'success') {
	              listaZauzetihSedista = data.zauzetaSedista;
	              console.log("Lista zauzetih sedista: " + listaZauzetihSedista);
	          }

	      });
	      promeniZauzetaSedista(listaZauzetihSedista);
	}
	
	function promeniZauzetaSedista(listaZauzetihSedista) {
		let i;
		for (i = 0; i < listaZauzetihSedista.length; ++i) {
			$("#odabirSedista").find("label[for='"+listaZauzetihSedista[i]+"']").css('background-color', 'rgba(220, 53, 69)');
			$("#odabirSedista").find("label[for='"+listaZauzetihSedista[i]+"']").attr('disabled', 'disabled');
			$("#odabirSedista").find("#"+listaZauzetihSedista[i]+"").attr('disabled', 'disabled');
		}
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
                
                $('#inputFilm1').val(PROJEKCIJA.film.naziv).trigger("change");
                $('#inputDatumVreme1').val(dateFormat(new Date(PROJEKCIJA.datumVreme)).split(" ")[0]).trigger("change");
                $('#inputTipProjekcije1').val(PROJEKCIJA.tipProjekcije.slice(3,5)).trigger("change");
                $('#inputSala1').val(PROJEKCIJA.sala.naziv).trigger("change");
                $('#inputCena1').val(PROJEKCIJA.cenaKarte).trigger("change");
                var brojSelektovanihSedista = selektovanaSedista.length;
                var ukupnaCena = brojSelektovanihSedista * PROJEKCIJA.cenaKarte;
                $('#inputSedista').val(selektovanaSedista.toString()).trigger("change");
                $('#inputUkupnaCena').val(ukupnaCena).trigger("change");
                
                kartaSala = PROJEKCIJA.sala.id;
            }

        }).done(getSedista);

    }
	
	function getSedista() {
		for(var ss of selektovanaSedista) {
			var params = {
				'redniBroj': ss,
				'salaId': kartaSala,
			}
			
			$.get('SedisteServlet', params, function(data){
				if (data.status == 'success') {
					var SEDISTE = data.trazenoSediste;
					karteSedista.push(SEDISTE.id);
				}
			});
		}
	}

	function dateFormat(datum){
        let datumString = datum.getFullYear() + "-" + ("0" + (datum.getMonth() + 1)).slice(-2) + "-" + ("0" + datum.getDate()).slice(-2) + " " + ("0" + datum.getHours()).slice(-2) + ":" + ("0" + datum.getMinutes()).slice(-2)
        return datumString;
    }
	
});