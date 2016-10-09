<!--<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="RespMens_Style.css" media="screen" />
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/fileinput.min.css">
<link rel="stylesheet" type="text/css" href="PopUpStyle.css" media="screen" />
<title>Responder Mensaje</title>
</head>

<script type="text/javascript">

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
		"url": "http://servidorgrupo8.azurewebsites.net/Servidor/respondermensaje?nick_jugador=" + destinatario + "&asunto=" + asunto + "&contenido=" + contenido + "&id_profesor=marce_fing",
		//"url": "http://localhost:8080/Servidor/respondermensaje?nick_jugador=" + destinatario + "&asunto=" + asunto + "&contenido=" + contenido +"&id_profesor=marce_fing",
		"method": "POST",
  		"headers": {
  			//"Access-Control-Allow-Origin": "*",
    		"cache-control": "no-cache",
  		}
	}

	$.ajax(settings).done(function (response) {

	});
	
	//window.location.href = "VerMensajes.jsp"

}

</script>

<body onload="cargarMensaje()">
	<form id="contact-form" method="post" action="VerMensajes.jsp" role="form">
		<div class="responder-mensaje-page">
			<div class="form">
				<h2 class="title" style="font-family: serif;">Responder Mensaje</h2>
				<br>
				<div class="row">

					<label>Destinatario</label>
					<textarea id="destino" name="destino" class="form-control" required="required" data-error="Debe ingresar un destinatario."></textarea>
					<!--  <div class="help-block with-errors"></div>-->
					
					<br>

					<label>Asunto</label>
					<textarea id="asunto" name="asunto" class="form-control" required="required" data-error="Debe ingresar un asunto."></textarea>
					<div class="help-block with-errors"></div>

					<br>

					<label for="form_mensaje">Mensaje</label>
					<textarea id="form_mensaje" name="mensaje" class="form-control2" rows="4" required="required" data-error="Debe escribir un mensaje"></textarea>
					<div class="help-block with-errors"></div>

				</div>
				<br>
				
				<div class="row">
					<button onclick="guardarMensaje()" type="submit" class="btn btn-primary btn-select" style="width: 30%">Enviar</button>
				</div>
			</div>
		</div>
	</form>
<script src="bootstrap/js/jquery.js"></script>
</body>
</html>