<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<meta name="generator" content="WYSIWYG Web Builder 11 Trial Version - http://www.wysiwygwebbuilder.com">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="index.css" rel="stylesheet">
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
		<div id="Layer1" style="position:absolute;text-align:center;left:0px;top:0px;width:100%;height:97px;z-index:3;">
		<div id="Layer1_Container" style="width:800px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
			<div id="wb_Text6" style="position:absolute;left:319px;top:10px;width:472px;height:61px;z-index:0;text-align:left;">
				<span style="color:#FFFFFF;font-family:'Trebuchet MS';font-size:48px;"><strong> Profesor</strong></span>
			</div>
			<div id="wb_Image1" style="position:absolute;left:1px;top:2px;width:173px;height:94px;z-index:1;">
				<img src="Imagenes/Logo.png" id="Image1" alt="">
			</div>
		</div>
	</div>
	<div id="container">
		<div id="wb_Shape4" style="position:absolute;left:10px;top:88px;width:781px;height:46px;z-index:4;">
			<div id="Shape4">
			</div>
		</div>
		
		<div id="wb_CssMenu1" style="position:absolute;left:145px;top:97px;width:504px;height:28px;z-index:9;">
			<ul>
				<li class="firstmain"><a class="active" href="./index.html" target="_self" title="Home">Home</a>
				</li>
				<li><a href="./VerMensajes.jsp" target="_self" title="Mensajes">Mensajes</a>
				</li>
				<li><a class="withsubmenu" href="#" target="_self" title="Services">Nuevo</a>

					<ul>
						<li class="firstitem"><a href="./NuevaPregunta.jsp" target="_self" title="Problema">Problema</a>
						</li>
						<li><a href="./AgregarMundo.jsp" target="_self" title="Mundo">Mundo</a>
						</li>
						<li class="lastitem"><a href="./AgregarNivel.jsp" target="_self" title="Nivel">Nivel</a>
						</li>
					</ul>
				</li>
				<li><a href="./VerEstadisticas.jsp" target="_self" title="Estadisticas">Estadisticas</a>
				</li>
			</ul>
		</div>
		<div id="wb_Text3" style="position:absolute;left:22px;top:149px;width:215px;height:29px;z-index:5;text-align:left;">
			<div style="position:absolute;left:0px;top:0px;width:215px;height:29px;"><span style="color:#03354E;font-family:'Trebuchet MS';font-size:24px;">Agregar Nivel</span>
			</div>
		</div>
		<div id="wb_Shape3" style="position:absolute;left:10px;top:179px;width:782px;height:3px;z-index:6;">
			<div id="Shape3"></div>
		</div>

		<div id="wb_Text10" style="position:absolute;left:25px;top:562px;width:205px;height:180px;z-index:8;text-align:left;">
	
		</div>
		<!-- wb_Shape5 es el contenedor donde van las cosas -->
		<div id="wb_Shape5" style="position:absolute;left:10px;top:204px;width:781px;height:548px;z-index:10;">
			<div id="Shape5">
			</div>
		</div>
		<div id="wb_Text1" style="position:absolute;left:48px;top:240px;width:705px;height:42px;z-index:11;text-align:left;">
			
			<!-- Lo que ya teniaaa empieza aca -->
			<p><b>Seleccione el mundo en el que desea agregar un nuevo nivel</b></p>
		<br>
 		<select id ="lista" class="form-control" onchange="habilitarCrear()">
 		<option value ="">Seleccione el mundo</option>
		</select>
		<br><br>
		<button id="myBtn" disabled="disabled" onclick="AgregarNivel()">Agregar Nivel</button>
				<!-- Lo que ya teniaaa termina aca -->
		</div>

	</div>
	<div id="Layer3" style="position:absolute;text-align:center;left:0px;top:772px;width:100%;height:26px;z-index:13;">
		<div id="Layer3_Container" style="width:800px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
		</div>
	</div>
	<div id="Layer4" style="position:absolute;text-align:center;left:0px;top:798px;width:100%;height:100px;z-index:14;">
		<div id="Layer4_Container" style="width:800px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">

		</div>
	</div>
<script src="bootstrap/js/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>