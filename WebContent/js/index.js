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
    var nazivInput = $('#nazivInput');
    var zanrInput = $('#zanrInput');
    var trajanjeMinInput = $('#trajanjeMinInput');
    var trajanjeMaxInput = $('#trajanjeMaxInput');
    var godinaProizvodnjeMinInput = $('godinaProizvodnjeMinInput');
    var godinaProizvodnjeMaxInput = $('godinaProizvodnjeMaxInput');
    var distributerInput = $('distributerInput');
    var zemljaPoreklaInput = $('zemljaPoreklaInput');
    var tabelaFilmova = $('#tabelaFilmova');
    
    //Navigacija
    var navigationButtons = $('#navigationButtons');
    var btnOdjava;
    var btnMojNalog;
    var btnKorisnici;
    var btnKupiKartu;
    var btnProjekcije;
    makeButtons();
    changeInterface();
    
    
    function changeInterface() {
    	let params = { 
    	        'action' : 'loggedInUserRole'
    	      }
    	      $.get('UserServlet', {'action': 'loggedInUserRole'}, function(data) {
    	        console.log(data.status);
    	        if (data.status == 'unauthenticated') {
    	          $('#btnOdjava').remove();
    	          $('#btnMojNalog').remove();
    	          $('#btnKorisnici').remove();
    	          $('#btnKupiKartu').remove();
    	          $('#btnProjekcije').remove();
    	          $('#btnRegistracija').show();
    	          $('#btnPrijava').show();
    	          return;
    	        }

    	        if (data.status == 'success') {
    	          $('#btnRegistracija').hide();
    	          $('#btnPrijava').hide();
		          navigationButtons.append(btnKupiKartu);
		          console.log(data.loggedInUserRole);
    	          if(data.loggedInUserRole == 'ADMINISTRATOR'){
    	            navigationButtons.append(btnKorisnici);
    	            navigationButtons.append(btnProjekcije);
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
    				console.log('odjavljen');
    				return;
    			}else {
    				console.log("Nista");
    			}
    		});
    		$('input').val('');
    		location.reload();
    		return false;
    	});
    	
    	btnMojNalog = $('<li id="btnMojNalog"><a class="nav-link" href="profil.html">Moj nalog</a></li>').on('click', function(){
            let param = { 'action' : "loggedInUserId"}
            $.get('UserServlet', param, function(data) {
              if (data.status == 'success') {
                let url = 'Korisnik.html?id=' + data.loggedInUserId;
                window.location.replace(url);
                return;
              }
            });
         });
    	
    	btnKorisnici = $('<li id="btnKorisnici"><a class="nav-link" href="korisnici.html">Korisnici</a></li>');
        btnKupiKartu = $('<li id="btnKupiKartu"><a class="nav-link" href="kupovina.html">Kupi kartu</a></li>');
        btnProjekcije = $('<li id="btnProjekcije"><a class="nav-link" href="projekcije.html">Projekcije</a></li>')
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