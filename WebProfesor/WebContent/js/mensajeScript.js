/**
 * 
 */
function cargarMensaje(){
	//alert("entro al cargar");
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
  		//"url": "http://servidorgrupo8.azurewebsites.net/Servidor/vermensaje?id_mensaje=" + param,
		"url" : getUrl("vermensaje?id_mensaje=" + param),
  		//"url": "http://localhost:8080/Servidor/vermensaje?nick=marce_fing&id_mensaje=" + param,
  		"method": "GET",
  		"headers": {
  			"Access-Control-Allow-Origin": "*",
    		"cache-control": "no-cache",
  			}
		}

	$.ajax(settings).done(function (response) {		    	    			    	    
		var mensaje= response;
		//alert("leyo el msj");
		$("#asunto").text(mensaje.asunto);
		$("#remitente").text(mensaje.remitente);
		$("#contenido").text(mensaje.contenido);
			 	
//		var url = "ResponderMensaje.jsp?remitente=" + mensaje.remitente + "&asunto=" + mensaje.asunto;
//	    $("#responder").attr("href",url);
			 	
		$("#destinatario").text(mensaje.remitente);
		$("#asuntoEnviar").text(mensaje.asunto);
		

	});
	
	//------------marcar mensaje como leido--------------
	var settings = {
		"async": true,
		"crossDomain": true,
		//"url": "http://servidorgrupo8.azurewebsites.net/Servidor/mensajeleido?nick=marce_fing&id_mensaje=" + param,
	    "url": getUrl("mensajeleido?nick=marce_fing&id_mensaje=" + param),
		//"url": "http://localhost:8080/Servidor/mensajeleido?nick=marce_fing&id_mensaje" + param,
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

/****************RESPONDER MENSAJE**************/

function guardarMensaje(){
	
	var destinatario = $('#destinatario').val();
	var asunto = $('#asuntoEnviar').val();
	var contenido = $('#mensajeEnviar').val();
	
	var settings = {
  		"async": true,
  		"crossDomain": true,
		"url": getUrl("respondermensaje?nick_jugador=" + destinatario + "&asunto=" + asunto + "&contenido=" + contenido + "&id_profesor=marce_fing"),
		//http://servidorgrupo8.azurewebsites.net/Servidor/respondermensaje?nick_jugador=" + destinatario + "&asunto=" + asunto + "&contenido=" + contenido + "&id_profesor=marce_fing",
		
		"method": "POST",
  		"headers": {
  			"Access-Control-Allow-Origin": "*",
    		"cache-control": "no-cache",
  		}
	}

	$.ajax(settings).done(function (response) {
		//alert("envio el msj");
		window.location.href = "VerMensajes.jsp"
		alert("Mensaje enviado");

	});
	
	

}

