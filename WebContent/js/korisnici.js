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
    var korisnickoImeInput = $('#korisnickoImeInput');
    var uloga = $('#uloga');
    
    var tabelaKorisnika = $('#tabelaKorisnika');

    //Navigacija
    var navigationButtons = $('#navigationButtons');
    var btnOdjava;
    var btnMojNalog;
    var btnKorisnici;
    var btnKupiKartu;
    var btnProjekcije;
    makeButtons();
    changeInterface();
    getUsers();
    
    
    function getUsers() {
    	var korisnickoImeFilter = korisnickoImeInput.val();
    	var ulogaFilter = uloga.val();
    	
    	var params = {
    		'korisnickoImeFilter' : korisnickoImeFilter,
    		'ulogaFilter' : ulogaFilter,
    		'action' : "allUsers"
    	};
    	
    	console.log(params);
    	
    	$.get('UserServlet', params, function(data){
    		if (data.status = 'success') {
    			tabelaKorisnika.find('tbody').remove();
    			var korisnici = data.allUsers;
    			console.log(data.allUsers);
    			for(k in korisnici) {
    				tabelaKorisnika.append(
    					'<tbody>' +
	                        '<tr>' + 
	                          '<td align="left"><a href="profil.html?id=' + korisnici[k].id + '">' + korisnici[k].korisnickoIme + '</a></td>' +
	                          '<td align="left">' + dateFormat(new Date(korisnici[k].datumRegistracije)) + '</td>' + 
	                          '<td align="left">' + korisnici[k].uloga + '</td>' +
	                        '</tr>' +
	                    '</tbody>'	
    				)
    			}
    		}else {
    			window.location.replace('index.html');
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
				console.log(data.loggedInUserRole);
				if(data.loggedInUserRole == 'KORISNIK'){
					alert('Greska, nije vam dozovoljen pristup ovoj stranici!');
		            window.location.replace("index.html");
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
    }
    
    function dateFormat(datum){
        let datumString = datum.getFullYear() + "-" + ("0" + (datum.getMonth() + 1)).slice(-2) + "-" + ("0" + datum.getDate()).slice(-2) + " " + ("0" + datum.getHours()).slice(-2) + ":" + ("0" + datum.getMinutes()).slice(-2) + ":" + ("0" + datum.getSeconds()).slice(-2)
        return datumString;
    }
    
    korisnickoImeInput.on('keyup', function(event) {
		getUsers();

		event.preventDefault();
		return false;
    });
    
    uloga.on('change', function(event) {
    	getUsers();

		event.preventDefault();
		return false;
    });
    
});