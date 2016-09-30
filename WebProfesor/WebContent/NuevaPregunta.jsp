<!--<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="loginStyle.css" media="screen" />
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
</div>
</div>
<script src="bootstrap/js/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>