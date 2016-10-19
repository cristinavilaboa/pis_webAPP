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

<title>Estadisticas</title>

<script type="text/javascript">
function cargarEstadisticas(){


//------------cargar datos de estadisticas-------------------
	var settings = {
	  		"async": true,
	  		"crossDomain": true,
	  		"url": "http://servidorgrupo8.azurewebsites.net/Servidor/verestadisticas",
			  //"url": "http://localhost:8080/Servidor/verestadisticas",
	  		"method": "GET",
	  		"headers": {
	  			"Access-Control-Allow-Origin": "*",
	    		"cache-control": "no-cache",
	  			}
			}
			
	$.ajax(settings).done(function (response) {
		var estadisticas= response.lista;
		$.each(estadisticas, function (index, item) {
			
    		var eachrow = "<tr>"
                + "<td> " + item.id_problema + "-"
                + item.nro_nivel + "-"
                + item.id_mundo + " </td>"
                + "<td> " + item.cant_intentos + " </td>"
                + "<td> " + item.cant_aciertos + " </td>"
                + "</tr>";
    		$('#tbody').append(eachrow);
    		
		});

	});	
	
	//------------cargar datos de ranking-------------------
	var settings = {
	  		"async": true,
	  		"crossDomain": true,
	  		"url": "http://servidorgrupo8.azurewebsites.net/Servidor/verranking",
			  //"url": "http://localhost:8080/Servidor/verranking",
	  		"method": "GET",
	  		"headers": {
	  			"Access-Control-Allow-Origin": "*",
	    		"cache-control": "no-cache",
	  			}
			}
			
	$.ajax(settings).done(function (response) {
		var estadisticas= response.lista;
		$.each(estadisticas, function (index, item) {
			
    		var eachrow = "<tr>"
                + "<td> " + item.nick + " </td>"
                + "<td> " + item.puntos+ " </td>"
                + "</tr>";
    		$('#tbody').append(eachrow);
    		
		});

	});		
	
	

}



</script>

</head>
<body onload="cargarEstadisticas()">
	  <div class="login-page" style="width: 720px"> 
		<div>
			<div id="div1" class="form" >
			<form action="Menu.html">
			<button style="width:25%; padding: 5px; text-align: center; margin-top: 1px; margin-right: 2px; position:absolute; top:0; right:0; font-size:12px; text-transform:none;" >Menú Principal</button>
			</form>
			<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#home">Estadisticas</a></li>
					<li><a data-toggle="tab" href="#menu1">Ranking</a></li>
				</ul>

				<div class="tab-content">
					<div id="home" class="tab-pane fade in active">



						<table class="table table-hover">
					<thead id="thead">
						<tr>
							<th style="text-align: left;">Pregunta-Nivel-Mundo</th>
							<!--  <th style="text-align: left;">Nivel</th>
							<th style="text-align: left;">Mundo</th> -->
							<th style="text-align: left;">Cantidad de Intentos</th>
							<th style="text-align: left;">Cantidad de Aciertos</th>
						</tr>
					</thead>
					<tbody id="tbody">
								
					</tbody>
				</table>

  
					</div>
					<div id="menu1" class="tab-pane fade">
						<table class="table table-hover">
							<thead id="theadviejos">
								<tr>
									<th style="text-align: center;">Jugador</th>
									<th style="text-align: center;">Puntos</th>
								</tr>
							</thead>
							<tbody id="tbodyviejos">
								
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