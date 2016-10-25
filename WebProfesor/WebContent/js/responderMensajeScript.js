/**
 * 
 */
function cargarMensaje(){
	
	function getParameters(variable){
		
		var query=window.location.search.substring(1);
		var vars=query.split("&");
		for (var i=0;i<vars.length ;i++){
			var pair=vars[i].split("=");
			if(pair[0]==variable){
				//alert(pair[1]);
				return pair[1];
			}
		}
		return false;
	}
	
	var remitente = getParameters("remitente");
	var asunto = getParameters("asunto");
	
	var as = asunto.replace(/%20/g, " ");
	var re = remitente.replace(/%20/g, " ");
	
	$('#destino').text(re);
	$('#asunto').text("Re: " + as);
	
}


function guardarMensaje(){
	
	var destinatario = $('#destino').val();
	var asunto = $('#asunto').val();
	var contenido = $('#form_mensaje').val();
	
	var settings = {
  		"async": true,
  		"crossDomain": true,
		"url": getUrl("respondermensaje?destinatario=" + destinatario + "&asunto=" + asunto + "&contenido=" + contenido + "&remitente=marce_fing"),
		//http://servidorgrupo8.azurewebsites.net/Servidor/respondermensaje?destinatario=" + destinatario + "&asunto=" + asunto + "&contenido=" + contenido + "&remitente=marce_fing",
		
		"method": "POST",
  		"headers": {
  			"Access-Control-Allow-Origin": "*",
    		"cache-control": "no-cache",
  		}
	}

	$.ajax(settings).done(function (response) {
		//alert("envio el msj");
		window.location.href = "VerMensajes.jsp"

	});
	
	

}
function Salir(){
	window.location.href = "login.html"
}
