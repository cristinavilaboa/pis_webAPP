<!--<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/fileinput.min.css">
<link rel="stylesheet" type="text/css" href="loginStyle.css" media="screen" />
<link rel="stylesheet" type="text/css" href="index.css" media="screen" />
<link rel="stylesheet" type="text/css" href="PopUpStyle.css" media="screen" />
</head>
<title>Nueva Pregunta</title>
<script type="text/javascript" src="js/global_source.js"></script>
<script type="text/javascript" src="js/nuevaPreguntaScript.js"></script>
</head>
<body onload="cargarMundos()">		
	<!-- ************************** HEADER ***************************************-->
	<div id="Layer1" style="position:absolute;text-align:center;left:0px;top:0px;width:100%;height:97px;z-index:3;">
		<div id="Layer1_Container" style="width:800px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
			<div id="wb_Text6" style="position:absolute;left:319px;top:10px;width:472px;height:61px;z-index:0;text-align:left;">
				<!-- <span style="color:#000000;font-family:'Trebuchet MS';font-size:48px;"><strong> Profesor</strong></span> -->
			</div>
			<div id="wb_Image1" style="position:absolute;left:35%;top:2px;width:173px;height:94px;z-index:1;">
				<img src="Imagenes/Logo.png" id="Image1" alt="">
			</div>
		</div>
		<button class="estilonuestro" style="position:absolute;left:90%;top:20px;z-index:1; width:90px;height:30px; padding:5px; font-family:'Trebuchet MS'; text-align:center; cursor: pointer;" onclick="Salir()">Salir</button>
	</div>
	<div id="container">
		<div id="wb_Shape4" style="position:absolute;left:10px;top:88px;width:781px;height:46px;z-index:4;">
			<div id="Shape4">
			</div>
		</div>
		<div id="wb_Text3" style="position:absolute;left:22px;top:149px;width:215px;height:29px;z-index:5;text-align:left;">
			<div style="position:absolute;left:0px;top:0px;width:215px;height:29px;"><span style="color:#03354E;font-family:'Trebuchet MS';font-size:24px;">Nuevo Problema</span>
			</div>
		</div>
		<div id="wb_Shape3" style="position:absolute;left:10px;top:179px;width:782px;height:3px;z-index:6;">
			<div id="Shape3"></div>
		</div>

		<div id="wb_Text10" style="position:absolute;left:25px;top:562px;width:205px;height:180px;z-index:8;text-align:left;">
	
		</div>
		<div id="wb_CssMenu1" style="position:absolute;left:145px;top:97px;width:504px;height:28px;z-index:9;">
			<ul>
				<li class="firstmain"><a href="./index.html" target="_self" title="Home">Inicio</a>
				</li>
				<li><a href="./VerMensajes.jsp" target="_self" title="Mensajes">Mensajes</a>
				</li>
				<li><a  class="active" class="withsubmenu" href="#" target="_self" title="Services">Nuevo</a>

					<ul>
						<li class="firstitem"><a href="./NuevaPregunta.jsp" target="_self" title="Problema">Problema</a>
						</li>
						<li><a href="./AgregarMundo.jsp" target="_self" title="Mundo">Mundo</a>
						</li>
						<li class="lastitem"><a href="./AgregarNivel.jsp" target="_self" title="Nivel">Nivel</a>
						</li>
					</ul>
				</li>
				<li><a href="./VerEstadisticas.jsp" target="_self" title="Estadisticas">Estadísticas</a>
				</li>
			</ul>
		</div>
	<!-- ************************** FIN HEADER ***************************************-->
	<div id="wb_Shape5" style="position:absolute;left:10px;top:204px;width:781px;height:548px;z-index:4;">
		<div id="Shape5">
		</div>
	</div>
	<div id="wb_Text1" style="position:absolute;left:80px;top:256px;width:705px;height:42px;z-index:11;text-align:left;">
		<span style="color:#FFFFFF;font-family:'Trebuchet MS';font-size:20px;"><strong>Seleccione el mundo y nivel para el problema</strong></span><span style="color:#FFFFFF;font-family:'Trebuchet MS';font-size:13px;"><br></span>
		<br>
 		<select id ="lista" class="form-control" onchange="cargarNiveles()">
 		<option value ="">Seleccione el mundo</option>
		</select>
		<br><br>
		<select id ="lista2" class="form-control" onchange="habilitarCrear()" size="1">
		<option value = "">Seleccione el nivel</option>
		</select> 	
 		<br><br><br><br>
		<button class="estilonuestro" id="myBtn" disabled="disabled">Crear Problema</button>
	</div>		
	</div>
		<!-- ********************************************FOOTER *****************************************-->
	<div id="Layer3" style="position:absolute;text-align:center;left:0px;top:772px;width:100%;height:26px;z-index:13;">
		<div id="Layer3_Container" style="width:800px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
		</div>
	</div>
	<div id="Layer4" style="position:absolute;text-align:center;left:0px;top:798px;width:100%;height:100px;z-index:14;">
		<div id="Layer4_Container" style="width:800px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
		</div>
	</div>
	<!-- ********************************************FIN FOOTER *****************************************-->



<!-- PopUp -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">x</span>
    <section>
    <header>
    <h2>Complete la información para crear el nuevo problema</h2>
    </header>
    	<!--  <form action="NuevaPregunta.jsp" method="post" onsubmit="return guardarPregunta();">-->
    	<table width="100%" border="0" cellpadding="5">
    	<tr>
    	<td>
	    <div style="width: 100%;">
    		<label class="control-label">Seleccione el archivo del problema</label>
			<input id="input-1" type="file" class="file" width="50px" required="required">
    	</div>
		</td>
		<td>
		<div>
    	<label>Descripción del problema</label>
    	<textarea id ="descripcion" rows="5" required="required"></textarea>
    	<br><br>
    	<label>Puntaje</label>
    	<input id ="puntaje" required="required"></input>
    	</div>
    	</td>
		<td>
		<div>
    	<label>Respuesta</label>
    	<textarea id="respuesta" rows="10" cols="5" required="required"></textarea>
    	</div>
    	</td>
    	<td>
		<div>
    	<label>Ayuda</label>
    	<textarea id ="ayuda" rows="10" cols="5" required="required"></textarea>
    	</div>
    	</td>
    	</tr>
    	</table>
    	<footer>
    	<button class="estilonuestro" onclick="guardarPregunta()">Guardar Problema</button>
		</footer>
		<!-- </form> -->
	</section>
  </div>
</div>

<script>
var modal = document.getElementById('myModal');

//Get the button that opens the modal
var btn = document.getElementById("myBtn");

//Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

//When the user clicks the button, open the modal
btn.onclick = function() {
modal.style.display = "block";
}

//When the user clicks on <span> (x), close the modal
span.onclick = function() {
modal.style.display = "none";
}

//When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
if (event.target == modal) {
   modal.style.display = "none";
}
}
</script>
<script src="bootstrap/js/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/fileinput.min.js"></script>
</body>
</html>