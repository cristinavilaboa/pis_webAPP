<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/fileinput.min.css">
<link rel="stylesheet" type="text/css" href="loginStyle.css" media="screen" />
<meta name="generator" content="WYSIWYG Web Builder 11 Trial Version - http://www.wysiwygwebbuilder.com">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="index.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="PopUpStyle.css" media="screen" />
<title>Agregar Mundo</title>
</head>
<script type="text/javascript" src="js/global_source.js"></script>
<script type="text/javascript" src="js/agregarMundoScript.js"></script>
<body>
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
			<div style="position:absolute;left:0px;top:0px;width:215px;height:29px;"><span style="color:#03354E;font-family:'Trebuchet MS';font-size:24px;">Agregar Mundo</span>
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
				<li><a class="active" class="withsubmenu" href="#" target="_self" title="Services">Nuevo</a>

					<ul>
						<li><a href="./AgregarMundo.jsp" target="_self" title="Mundo">Mundo</a>
						</li>
						<li class="lastitem"><a href="./AgregarNivel.jsp" target="_self" title="Nivel">Nivel</a>
						</li>
						<li class="firstitem"><a href="./NuevaPregunta.jsp" target="_self" title="Problema">Problema</a>
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
		<span style="color:#FFFFFF;font-family:'Trebuchet MS';font-size:20px;"><strong>Complete la información para crear el nuevo mundo</strong></span><span style="color:#FFFFFF;font-family:'Trebuchet MS';font-size:13px;"><br></span>
		<br>
		
			<!-- Lo que ya teniaaa empieza aca -->
    	<table width="100%" border="0" cellpadding="5">
    	<tr>
    	<td>
	    <div style="width: 100%;">
    		<label class="control-label" style="font-family: 'Trebuchet MS';">Seleccione la imagen del mundo</label>
			<input id="input-1" type="file" class="file" width="50px">
    	</div>
		</td>
		<td>
		</td>
		<td>
		<div>
			<label style="font-family: 'Trebuchet MS';">Nombre</label>
    		<input id="nombre">
    		<br><br>
    		<label style="font-family: 'Trebuchet MS';">Experiencia</label>
    		<input id ="experiencia"></input>
    	</div>
    	</td>
		<td>
		<div>
			<label style="font-family: 'Trebuchet MS';">Descripción del Mundo</label>
    		<textarea id ="descripcion" rows="5"></textarea>
    	</div>
    	</td>
    	</tr>
    	</table><br><br>
    	<button class="estilonuestro" onclick="guardarImagen()" style="width:200px; position: absolute; left: 250px">Agregar Mundo</button>
				<!-- Lo que ya teniaaa termina aca -->
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

<script src="bootstrap/js/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/fileinput.min.js"></script>
</body>
</html>