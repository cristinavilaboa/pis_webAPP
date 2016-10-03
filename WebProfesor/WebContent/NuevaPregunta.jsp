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

function cargarMundos(){
	var settings = {
			  "async": true,
			  "crossDomain": true,
			  "url": "http://localhost:8080/CrunchifyTutorials/api/listar",
			  "method": "GET",
			  "headers": {
			    "cache-control": "no-cache",
			    "postman-token": "e541a5ec-37e8-68b0-6b26-ae3c285d031c"
			  },
			  "data": "{\r\n    \"tutorials\": {\r\n        \"id\": \"Crunchify\",\r\n        \"topic\": \"REST Service\",\r\n        \"description\": \"This is REST Service Example by Crunchify.\"\r\n    }\r\n}"
			}

			$.ajax(settings).done(function (response) {
				var mundos= response;
				var mun = response.split(" ");
				for (i = 0; i<mun.length;i++){
					var cell = $('<a href="#">');
					cell.text(mun[i]);
					var aux = cell.append('<li>');
					$('#lista').append(aux);	
				}
				
			});

}

$('#lista').click(function(){
	alert("hola")
});

</script>
</head>
<body onload="cargarMundos()">	
  <div class="form" style="height:300px">
  <div class="container" style="resize:auto;">
 <div class="dropdown">
 <button class="btn btn-primary dropdown-toggle btn-select" type="button" data-toggle="dropdown" style="width: 50%">Mundo <span class="caret"></span></button>
 <ul id = "lista" class="dropdown-menu scrollable-menu">
 </ul>
 </div>
<br><br>
<div class="dropdown">
 <button class="btn btn-primary dropdown-toggle btn-select" type="button" data-toggle="dropdown" style="width: 50%">Nivel <span class="caret"></span></button>
 <ul id = "lista2" class="dropdown-menu scrollable-menu">
 </ul>
 </div>
 <br><br><br><br>

<button id="myBtn">Crear Pregunta</button>
</div>
</div>
<!-- The Modal -->
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
	    <div style=" border: solid; width: 100%;">
    		<label class="control-label">Seleccione el archivo</label>
			<input id="input-1" type="file" class="file" width="50px">
    	</div>
		</td>
		<td>
		<div>
    	<label>Respuesta</label>
    	<textarea rows="10" cols="5"></textarea>
    	</div>
    	</td>
    	<td>
		<div>
    	<label>Explicación</label>
    	<textarea rows="10" cols="5"></textarea>
    	</div>
    	</td>
    	</tr>
    	</table>
    	<footer>
		<button>Guardar Pregunta</button>
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