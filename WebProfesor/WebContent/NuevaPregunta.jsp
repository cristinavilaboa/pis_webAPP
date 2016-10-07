<!--<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/fileinput.min.css">
<link rel="stylesheet" type="text/css" href="loginStyle.css" media="screen" />
<link rel="stylesheet" type="text/css" href="PopUpStyle.css" media="screen" />
</head>
<title>Nueva Pregunta</title>
<script type="text/javascript">

$(document).ready(function() {

	  $("#lista").change(function() {
	    var el = $(this) ;
	    $("#lista2").append("<option>SHIPPED</option>");
	  });

});

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
/****FUNCION PARA TRAER LOS NIVELES DEL MUNDO SELECCIONADO DESDE EL SERVIDOR****/

function cargarNiveles(){
		var id_mundo = $('#lista').val();
		//alert(id_mundo);

		var settings = {
			  "async": true,
			  "crossDomain": true,
			  //"url": "http://localhost:8080/Servidor/listarnivelesmundoprofesor?id_mundo="+id_mundo,
			  "url": "http://servidorgrupo8.azurewebsites.net/Servidor/listarnivelesmundoprofesor?id_mundo="+id_mundo,
			  "method": "GET",
			  "headers": {
			    "cache-control": "no-cache",
			    "Access-Control-Allow-Origin": "*",
			  }
			}

			$.ajax(settings).done(function (response) {
				var niveles= response;
				$('#lista2').empty();
				var celldefault = $('<option>');
				celldefault.val("");
				celldefault.text("Seleccione el nivel");
				$('#lista2').append(celldefault);
				for(i = 0;i<niveles.lista.length ;i++){
					var cell = $('<option>');
					cell.val(niveles.lista[i].id_nivel); //este es el que voy a usar para guardar el problema
					cell.text(niveles.lista[i].num_nivel);
					$('#lista2').append(cell);
				}
			});
};

/****FUNCION PARA GUARDAR LA PREGUNTA EN DROPBOX****/
function guardarPregunta(){
	var fileInput = document.getElementById('input-1');
	var file = fileInput.files[0];
	var nom = file.name;
	var formData = new FormData();
	formData.append("archivo", file);
	var settings = {
			  "async": true,
			  "crossDomain": true,
			  "url": "https://content.dropboxapi.com/1/files_put/auto/Preguntas/"+nom,
			  "method": "PUT",
			  "headers": {
			    "authorization": "Bearer 1tfe4ti31eAAAAAAAAAAG5czFEHm52Nz8-gUKW7Ji7lIbtDDUzka7FedQYY2eePG",
			    "cache-control": "no-cache"
			  },
			  "processData": false,
			  "contentType": false,
			  "mimeType": "multipart/form-data",
			  "data": formData
			}

		$.ajax(settings).done(function (response) {
		  	//alert("holaaaaaa")
		 	var datos = JSON.parse(response);
		  	//alert(datos.path);
			guardarProblema(datos.path);
		});
}
/****FUNCION PARA GUARDAR EL PROBLEMA EN EL SERVIDOR****/
function guardarProblema(path){
	//alert("entre al guardar");
	var mundo = $('#lista').val();
	var nivel = $('#lista2').val();
	var resp = $('#respuesta').val();
	var ayuda = $('#ayuda').val();
	var puntos = $('#puntaje').val();
	var desc = $('#descripcion').val();
	//alert(nivel);//+" "+nivel+" "+resp+" "+ayuda+" "+puntos+" "+desc+" "path);
	var settings = {
			  "async": true,
			  "crossDomain": true,
			  //"url": "http://localhost:8080/Servidor/agregarproblema?desc=" + desc + "&resp=" + resp + "&exp=" + puntos + "&ayuda=" + ayuda + "&cont=" + path + "&id_mundo=" + mundo + "&num_nivl=" + nivel + "&nick_prof=marce_fing",
			  "url": "http://servidorgrupo8.azurewebsites.net/Servidor/agregarproblema?desc=" + desc + "&resp=" + resp + "&exp=" + puntos + "&ayuda=" + ayuda + "&cont=" + path + "&id_mundo=" + mundo + "&num_nivl=" + nivel + "&nick_prof=marce_fing",
			  "method": "POST",
			  "headers": {
			    "cache-control": "no-cache",
			    "Access-Control-Allow-Origin": "*",
			  }
			}

			$.ajax(settings).done(function (response) {
			  //alert("agregobien");
			  $('#myModal').hide();
			});

}

function habilitarCrear(){
	$('#myBtn').attr('disabled', false);
}

</script>
</head>
<body onload="cargarMundos()">	
<div class="form" style="height:300px">
		<p><b>Seleccione el mundo y nivel para el problema</b></p>
		<br>
 		<select id ="lista" class="form-control" onchange="cargarNiveles()">
 		<option value ="">Seleccione el mundo</option>
		</select>
	<br><br>
		<select id ="lista2" class="form-control" onchange="habilitarCrear()" size="1">
		<option value = "">Seleccione el nivel</option>
		</select> 	
 	<br><br><br><br>
	<button id="myBtn" disabled="disabled">Crear Problema</button>
</div>

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
    	<label>Descripcion del problema</label>
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

<script type="text/javascript">
//Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
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