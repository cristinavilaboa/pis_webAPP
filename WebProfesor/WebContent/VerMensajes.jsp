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

//---------------cargar mensajes nuevos------------
	var settings = {
		"async": false,
		"crossDomain": true,
		"url": "http://servidorgrupo8.azurewebsites.net/Servidor/vermensajesnuevos?nick=marce_fing",
		//"url": "http://localhost:8080/Servidor/vermensajesnuevos?nick=marce_fing",
		"method": "GET",
		"dataType": 'jsonp',
		"headers": {
		"Access-Control-Allow-Origin": "*",
		"Access-Control-Allow-Methods": "GET, PUT, POST, DELETE, OPTIONS",
		
		"cache-control": "no-cache",
			},
		success: function(response) {
			        alert(response);
			        return response;        
			      },
		error: function() {
			        alert('ajax error');
			      }
		} 
		
		/*
		$.ajax({
			accepts: {json: "application/json"}, //With WCF 4.0, you can add an attribute called automaticFormatSelectionEnabled which allows the service to look at the Accept header in the HTTP request to determine what format to return
			type: "GET",
		    url: "http://servidorgrupo8.azurewebsites.net/Servidor/vermensajesnuevos?nick=marce_fing",
		    contentType: "application/json; charset=utf-8",
		    data: "nick=" + "marce_fing",
		    dataType: 'jsonp',
		    cache: false,
		    crossDomain:true,
		    headers: {
			"Access-Control-Allow-Origin": "*",
			
			"cache-control": "no-cache",
				},
		    success: function(response) {
		        alert(response);
		        return response;        
		      },
		    error: function(jqXHR, textStatus, errorThrown) {
		        alert('ajax error'+ jqXHR + ", " + errorThrown);
		      }
		      
		      $.ajax({
		            crossDomain: true,
		            type:"GET",
		            contentType: "application/json; charset=utf-8",
		            async:false,
		            url: "http://servidorgrupo8.azurewebsites.net/Servidor/vermensajesnuevos?nick=marce_fing",
		            data: { symbol: 'ctsh' },
		            dataType: "jsonp",                
		            jsonpCallback: 'fnsuccesscallback',
		            	headers: {
		        			"Access-Control-Allow-Origin": "*",
		        			"Access-Control-Allow-Methods": "GET, PUT, POST, DELETE, OPTIONS",
		        			
		        			"cache-control": "no-cache",
		        				}

		}).done(function (response) {*/

	$.ajax(settings).done(function (response) {

		var msjs= response.mensajes;

		$.each(msjs, function (index, item) {
			var dateStr = JSON.parse(item.fecha);          
			var date = new Date(dateStr);
			
    		var eachrow = "<tr>"
                + "<td> <a id=" + item.id + " href=#>" + item.remitente + "</a></td>"
                + "<td>" + item.asunto + "</td>"
                + "<td>" + date.toDateString() + "</td>"
                + "</tr>";
    		$('#tbodynuevos').append(eachrow);
    		
    		var url = "Mensaje.jsp?source=" + item.id;
    		$("#"+item.id).attr("href",url);
		});
		
	});	


//------------cargar mensajes viejos-------------------
	var settings2 = {
		"async": true,
		"crossDomain": true,
		//"url": "http://servidorgrupo8.azurewebsites.net/Servidor/vermensajesviejos?nick=marce_fing",
		"url": "http://localhost:8080/Servidor/vermensajesviejos?nick=marce_fing",
		"method": "GET",
		"headers": {
		"Access-Control-Allow-Origin": "*",	
		"cache-control": "no-cache",
		 },
		"data": "{\r\n    \"tutorials\": {\r\n        \"id\": \"Crunchify\",\r\n        \"topic\": \"REST Service\",\r\n        \"description\": \"This is REST Service Example by Crunchify.\"\r\n    }\r\n}"
		}

	$.ajax(settings2).done(function (response) {
		var msjs2= response.mensajes;
		
		$.each(msjs2, function (index, item) {
			var dateStr = JSON.parse(item.fecha);          
			var date = new Date(dateStr);
			//alert(date);
			
  			var eachrow = "<tr>"
              + "<td> <a id=" + item.id + " href=#>" + item.remitente + "</a>" + "</td>"
              + "<td>" + item.asunto + "</td>"
              + "<td>" + date.toDateString() + "</td>"
              + "</tr>" ;
              
  			$('#tbodyviejos').append(eachrow);
  
  			var url = "Mensaje.jsp?source=" + item.id;
    		$("#"+item.id).attr("href",url);
    		
		});
	});	
}



</script>

</head>
<body onload="cargarMensajes()">
	  <div class="login-page" style="width: 720px"> 
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