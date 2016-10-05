<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="loginStyle.css" media="screen" />
<title>Insert title here</title>
<script type="text/javascript">
function cargarMensaje(){
	
// funcion para obtener parametro de la url (el id del mensaje)
	(function($) {  
		    $.get = function(key)   {  
		        key = key.replace(/[\[]/, '\\[');  
		        key = key.replace(/[\]]/, '\\]');  
		        var pattern = "[\\?&]" + key + "=([^&#]*)";  
		        var regex = new RegExp(pattern);  
		        var url = unescape(window.location.href);  
		        var results = regex.exec(url);  
		        if (results === null) {  
		            return null;  
		        } else {  
		            return results[1];  
		        }  
		    }  
		})(jQuery); 
	var param = $.get("source");
	
	//---------------obtengo el mensaje con el id  y lo cargo------------
	var settings = {
			  "async": true,
			  "crossDomain": true,
			  "url": "http://localhost:8080/Servidor/vermensaje?nick=marce_fing&id_mensaje=" + param,
			  "method": "GET",
			  "headers": {
			    "cache-control": "no-cache",
			    "postman-token": "7d14f206-b080-cbba-0e72-c9cf186cf2ab"
			  }
			}

			$.ajax(settings).done(function (response) {
			 	var mensaje=response;
			 	$("#asunto").text("Asunto: " + mensaje.asunto);
			 	$("#remitente").text("Remitente: " + mensaje.remitente);
			 	$("#contenido").text(mensaje.contenido);
			});
	
	//------------marcar mensaje como leido--------------
	var settings = {
			  "async": true,
			  "crossDomain": true,
			  "url": "http://localhost:8080/Servidor/mensajeleido?nick_prof=marce_fing&id_mensaje" + param,
			  "method": "POST",
			  "headers": {
			    "cache-control": "no-cache",
			    "postman-token": "fbf8407c-9d93-61d9-2c1b-7e6d1d025c03"
			  }
			}

			$.ajax(settings).done(function (response) {
			  //console.log(response);
			});
	
}

</script>
</head>
<body onload="cargarMensaje()">
	<div class = "login-page">
		<div >
			<div class="form" >
				<h4 id=asunto style="text-align: left">   </h4>
				<p id=remitente style="text-align: left">  </p>
				<hr>
				<p id=contenido style="text-align: left"> </p>
				<br>
    			<form action="ResponderMensaje.html">
    				<button style="width: 4cm;"> Responder </button>
    			</form>
			</div>
		</div>
	</div>	
</body>
</html>