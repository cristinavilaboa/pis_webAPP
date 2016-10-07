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
  		"url": "http://servidorgrupo8.azurewebsites.net/Servidor/vermensaje?id_mensaje=" + param,
		  //"url": "http://localhost:8080/Servidor/vermensaje?nick=marce_fing&id_mensaje=" + param,
  		"method": "GET",
  		"headers": {
  			"Access-Control-Allow-Origin": "*",
    		"cache-control": "no-cache",
  			}
		}

	$.ajax(settings).done(function (response) {		    	    			    	    
		var mensaje= response;
			    
		$("#asunto").text("Asunto: " + mensaje.asunto);
		$("#remitente").text("Remitente: " + mensaje.remitente);
		$("#contenido").text(mensaje.contenido);
			 	
		var url = "ResponderMensaje.jsp?remitente=" + mensaje.remitente + "&asunto=" + mensaje.asunto;
	    $("#responder").attr("href",url);
			 	

	});
	
	//------------marcar mensaje como leido--------------
	var settings = {
		"async": true,
		"crossDomain": true,
		"url": "http://servidorgrupo8.azurewebsites.net/Servidor/mensajeleido?nick_prof=marce_fing&id_mensaje=" + param,
	  //"url": "http://localhost:8080/Servidor/mensajeleido?nick_prof=marce_fing&id_mensaje" + param,
		"method": "POST",
		"headers": {
			"Access-Control-Allow-Origin": "*",
			"cache-control": "no-cache",
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
				<hr>
				<br>
    			<div>
    				<a id="responder" href=# class="enlaceboton">Responder </a>
    			</div>
			</div>
		</div>
	</div>	
</body>
</html>