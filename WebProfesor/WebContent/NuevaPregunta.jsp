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
			  "url": "http://localhost:8080/Servidor/listarmundosprofesor",
			  "method": "GET",
			  "headers": {
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

		var settings = {
			  "async": true,
			  "crossDomain": true,
			  "url": "http://localhost:8080/Servidor/listarnivelesmundoprofesor?id_mundo="+id_mundo,
			  "method": "GET",
			  "headers": {
			    "cache-control": "no-cache",
			    "postman-token": "d3a4e224-807d-e314-5ba1-2291dbaa4ba0"
			  }
			}

			$.ajax(settings).done(function (response) {
				var niveles= response;
				$('#lista2').empty();
				for(i = 0;i<niveles.lista.length ;i++){
					var cell = $('<option>');
					cell.val(niveles.lista[i].num_nivel);
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
		  guardarProblema(response.data[0].path);
		});
}
/****FUNCION PARA GUARDAR EL PROBLEMA EN EL SERVIDOR EL SERVIDOR****/
function guardarProblema(){
	var mundo = $('#lista').val();
	var nivel = $ ('#lista2').val();
	var resp = $ ('#respuesta').val();
	var ayuda = $ ('#ayuda').val();
	var puntos = $ ('#puntaje').val();
	
	//cuando termine
	document.getElementById('myModal').style.display = "none";
}

</script>
</head>
<body onload="cargarMundos()">	
<div class="form" style="height:300px">
 		<select id ="lista" class="form-control" onchange="cargarNiveles()">
 		<option value ="">Seleccione el mundo</option>
		</select>
	<br><br>
		<select id ="lista2" class="form-control">
		<option value = "">Seleccione el nivel</option>
		</select> 	
 	<br><br><br><br>
	<button id="myBtn">Crear Pregunta</button>
</div>

<!-- PopUp -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">x</span>
    <section>
    <header>
    <h2>Complete la información para crear la nueva pregunta</h2>
    </header>
    	<table width="100%" border="0" cellpadding="5">
    	<tr>
    	<td>
	    <div style="width: 100%;">
    		<label class="control-label">Seleccione el archivo</label>
			<input id="input-1" type="file" class="file" width="50px">
    	</div>
		</td>
		<td>
		<div>
    	<label>Respuesta</label>
    	<textarea id="respuesta" rows="10" cols="5"></textarea>
    	</div>
    	</td>
    	<td>
		<div>
    	<label>Ayuda</label>
    	<textarea id ="ayuda" rows="10" cols="5" ></textarea>
    	</div>
    	</td>
    	<td>
		<div>
    	<label>Puntaje</label>
    	<input id ="puntaje"></input>
    	</div>
    	</td>
    	</tr>
    	</table>
    	<footer>
		<button onclick="guardarPregunta()">Guardar Pregunta</button>
		</footer>
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