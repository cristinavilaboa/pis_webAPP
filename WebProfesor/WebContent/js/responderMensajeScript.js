/**
 * 
 */
function cargarMensaje(){
	
function guardarMensaje(){
	
	var destinatario = $('#destinatario').val();
	var asunto = $('#asuntoEnviar').val();
	var contenido = $('#mensajeEnviar').val();
	
	var settings = {
  		"async": true,
  		"crossDomain": true,
		"url": getUrl("respondermensaje?destinatario=" + destinatario + "&asunto=" + asunto + "&contenido=" + contenido + "&remitente=marce_fing"),
		"method": "POST",
  		"headers": {
  			"Access-Control-Allow-Origin": "*",
    		"cache-control": "no-cache",
  		}
	}

	$.ajax(settings).done(function (response) {
		window.location.href = "VerMensajes.jsp"
		alert("Mensaje enviado");

	});
	
	

}
}
