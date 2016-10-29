/**
 * 
 */
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

function Salir(){
	window.location.href = "login.html"
}

