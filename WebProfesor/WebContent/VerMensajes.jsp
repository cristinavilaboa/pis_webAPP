<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="loginStyle.css" media="screen" /> 

<title>Mensajes</title>

<script type="text/javascript">
function cargarMensajes(){

//cargar mensajes nuevos
	var settings = {
		"async": true,
		"crossDomain": true,
		"url": "http://localhost:8080/Servidor/vermensajesnuevos?nick=marce_fing",
		"method": "GET",
		"headers": {
		"cache-control": "no-cache",
		"postman-token": "e541a5ec-37e8-68b0-6b26-ae3c285d031c"
		 },
		 "data": "{\r\n    \"tutorials\": {\r\n        \"id\": \"Crunchify\",\r\n        \"topic\": \"REST Service\",\r\n        \"description\": \"This is REST Service Example by Crunchify.\"\r\n    }\r\n}"
		}

	$.ajax(settings).done(function (response) {
		var msjs= response.mensajes;
	
		$.each(msjs, function (index, item) {
    		var eachrow = "<tr>"
                + "<td> <a href=Mensaje.html>" + item.remitente + "</a></td>"
                + "<td>" + item.asunto + "</td>"
                + "<td>" + item.fecha + "</td>"
                + "</tr>";
    		$('#tbodynuevos').append(eachrow);
		});
	});	



//cargar mensajes viejos
	var settings2 = {
		"async": true,
		"crossDomain": true,
		"url": "http://localhost:8080/Servidor/vermensajesviejos?nick=marce_fing",
		"method": "GET",
		"headers": {
		"cache-control": "no-cache",
		"postman-token": "e541a5ec-37e8-68b0-6b26-ae3c285d031c"
		 },
		"data": "{\r\n    \"tutorials\": {\r\n        \"id\": \"Crunchify\",\r\n        \"topic\": \"REST Service\",\r\n        \"description\": \"This is REST Service Example by Crunchify.\"\r\n    }\r\n}"
		}

	$.ajax(settings2).done(function (response) {
		var msjs2= response.mensajes;
	
		$.each(msjs2, function (index, item) {
  			var eachrow = "<tr>"
              + "<td> <a href=Mensaje.html>" + item.remitente + "</td>"
              + "<td>" + item.asunto + "</td>"
              + "<td>" + item.fecha + "</td>"
              + "</tr>";
  			$('#tbodyviejos').append(eachrow);
		});
	});	
	
}

</script>

</head>
<body onload="cargarMensajes()">
	  <div class="login-page"> 
		<div>
			<div id="div1" class="form">
				 <h2 style="font-family: serif;">Mensajes</h2> 
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#home">Mensajes
							Nuevos</a></li>
					<li><a data-toggle="tab" href="#menu1">Mensajes</a></li>
				</ul>

				<div class="tab-content">
					<div id="home" class="tab-pane fade in active">



						<table id="tabla" class="table table-hover">
							<thead>
								<tr>
									<th></th>
									<th>Asunto</th>
									<th>Fecha</th>
								</tr>
							</thead>
							<tbody id="tbodynuevos">
								<!--<tr id= "fila">
									<td id= "dato" ><a href="Mensaje.html">  </a></td>
									<!--  <td>asunto1</td>
									<td>fecha1</td> 
								</tr>
								<!--  <tr>
									<td><a href="Mensaje.html"> msj2 </a></td>
									<td>asunto2</td>
									<td>fecha2</td>
								</tr>
								<tr>
									<td><a href="Mensaje.html"> msj3 </a></td>
									<td>asunto3</td>
									<td>fecha3</td>
								</tr>-->
							  </tbody>
						</table>

  
					</div>
					<div id="menu1" class="tab-pane fade">
						<table class="table table-hover">
							<thead>
								<tr>
									<th></th>
									<th>Asunto</th>
									<th>Fecha</th>
								</tr>
							</thead>
							<tbody id="tbodyviejos">
								<!--  <tr>
									<td><a href="Mensaje.html"> msj1 </a></td>
									<td>asunto1</td>
									<td>fecha1</td>
								</tr>
								<tr>
									<td><a href="Mensaje.html"> msj2 </a></td>
									<td>asunto2</td>
									<td>fecha2</td>
								</tr>-->
							</tbody>
						</table>
					</div>
				</div> 
			</div>  
		</div>  
	   </div>

	<script src="bootstrap/js/jquery.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>