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
		"async": true,
		"crossDomain": true,
		"url": "http://servidorgrupo8.azurewebsites.net/Servidor/vermensajesnuevos?nick=marce_fing",
	  	//"url": "http://localhost:8080/Servidor/vermensajesnuevos?nick=marce_fing",
		"method": "GET",
		"headers": {
			"Access-Control-Allow-Origin": "*",
			"cache-control": "no-cache",
		}
	}
					
		/*
		      $.ajaxPrefilter( function (options) {
		    	  if (options.crossDomain && jQuery.support.cors) {
		    	    var http = (window.location.protocol === 'http:' ? 'http:' : 'https:');
		    	    options.url = http + '//cors-anywhere.herokuapp.com/' + options.url;
		    	    //options.url = "http://cors.corsproxy.io/url=" + options.url;
		    	  }
		    	});

		    	$.get(
		    	    'http://servidorgrupo8.azurewebsites.net/Servidor/vermensajesnuevos?nick=marce_fing',
		    	    function (response) {
		    	        
		//}).done(function (response) { */

	$.ajax(settings).done(function (response) {
		var msjs= response.mensajes;
		if (msjs.length > 0){
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
		} else{
			var eachrow = "<tr> <td> </td> <td> No hay mensajes nuevos </td> <td> </td> </tr>";
			$('#tbodynuevos').append(eachrow);
			}

	});	


//------------cargar mensajes viejos-------------------
	var settings2 = {
		"async": true,
		"crossDomain": true,
		"url": "http://servidorgrupo8.azurewebsites.net/Servidor/vermensajesviejos?nick=marce_fing",
	  //"url": "http://localhost:8080/Servidor/vermensajesviejos?nick=marce_fing",
		"method": "GET",
		"headers": {
			"Access-Control-Allow-Origin": "*",
			"cache-control": "no-cache",
		}
	}

	$.ajax(settings2).done(function (response) {		
		var msjs2= response.mensajes;
		
		if (msjs2.length > 0){
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
		} else{
			var eachrow = "<tr> <td> </td> <td> No hay mensajes viejos </td> <td> </td> </tr>";
			$('#tbodyviejos').append(eachrow);
		}
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
							<thead id="theadnuevos">
								<tr>
									<th></th>
									<th style="text-align: center;">Asunto</th>
									<th style="text-align: center;">Fecha</th>
								</tr>
							</thead>
							<tbody id="tbodynuevos">
								
							</tbody>
						</table>

  
					</div>
					<div id="menu1" class="tab-pane fade">
						<table class="table table-hover">
							<thead id="theadviejos">
								<tr>
									<th></th>
									<th style="text-align: center;">Asunto</th>
									<th style="text-align: center;">Fecha</th>
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