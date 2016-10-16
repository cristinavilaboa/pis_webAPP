<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="loginStyle.css" media="screen" />
<title>Agregar Nivel</title>
</head>
<script type="text/javascript">
/*$(document).ready(function() {

	  $("#lista").change(function() {
	    var el = $(this) ;
	    $("#lista2").append("<option>SHIPPED</option>");
	  });

});*/

/****FUNCION PARA TRAER LOS MUNDOS DESDE EL SERVIDOR****/
function cargarMundos(){
	var settings = {
			  "async": true,
			  "crossDomain": true,
			  //"url":"http://localhost:8080/Servidor/listarmundosprofesor",
			  "url": "http://servidorgrupo8.azurewebsites.net/Servidor/listarmundosprofesor",
			  "method": "GET",
			  "headers": {
				"Access-Control-Allow-Origin": "*",
				"content-type": "application/json",
			    "cache-control": "no-cache"
			  }
			}

			$.ajax(settings).done(function (response) {
				var mundos= response;
				for(i = 0;i<mundos.lista_mundos.length ;i++){
					var valor = response.lista_mundos[i].nombre;
					var cell = $('<option>');
					cell.val(response.lista_mundos[i].id_mundo);
					cell.text(response.lista_mundos[i].nombre);
					$('#lista').append(cell);	
				}
				
			});
}

/****FUNCION PARA AGREGAR UN NIVEL AL MUNDO SELECCIONADO****/

function AgregarNivel(){
	var id_mundo = $('#lista').val();
	var settings = {
			  "async": true,
			  "crossDomain": true,
			  //"url": "http://localhost:8080/Servidor/agregarnivel?id_mundo=" + id_mundo,
			  "url": "http://servidorgrupo8.azurewebsites.net/Servidor/agregarnivel?id_mundo=" + id_mundo,
			  "method": "POST",
			  "headers": {
			    "cache-control": "no-cache",
			    "Access-Control-Allow-Origin": "*",
			  }
			}

			$.ajax(settings).done(function (response) {
			  alert("agregobien");
			  location.href="Menu.html";
			});
}

function habilitarCrear(){
	$('#myBtn').attr('disabled', false);
}

</script>
<body onload="cargarMundos()">
<div class="login-page" style="width: 720px">
<div class="form" style="height:300px">
		<form action="Menu.html">
			<button style="width:25%; padding: 5px; text-align: center; margin-top: 1px; margin-right: 2px; position:absolute; top:0; right:0; font-size:12px; text-transform:none;" >Menú Principal</button>
			</form>
		<p><b>Seleccione el mundo en el que desea agregar un nuevo nivel</b></p>
		<br>
 		<select id ="lista" class="form-control" onchange="habilitarCrear()">
 		<option value ="">Seleccione el mundo</option>
		</select>
		<br><br>
		<button id="myBtn" disabled="disabled" onclick="AgregarNivel()">Agregar Nivel</button>
</div>
</div>
<script src="bootstrap/js/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>