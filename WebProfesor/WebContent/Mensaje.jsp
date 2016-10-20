<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="generator" content="WYSIWYG Web Builder 11 Trial Version - http://www.wysiwygwebbuilder.com">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="index.css" rel="stylesheet">
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
			<div style="position:absolute;left:0px;top:0px;width:215px;height:29px;"><span style="color:#03354E;font-family:'Trebuchet MS';font-size:24px;">Mensaje</span>
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
			<h4 id=asunto style="text-align: left">   </h4>
				<p id=remitente style="text-align: left">  </p>
				<hr>
				<p id=contenido style="text-align: left"> </p>
				<hr>
				<br>
    			<div>
    				<a id="responder" href=# class="enlaceboton">Responder </a>
    			</div>
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