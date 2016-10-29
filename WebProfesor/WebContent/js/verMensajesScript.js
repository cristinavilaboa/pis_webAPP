/**
 * 
 */
function cargarMensajes(){

//---------------cargar mensajes nuevos------------	
	var settings = {
		"async": true,
		"crossDomain": true,
		//"url": "http://servidorgrupo8.azurewebsites.net/Servidor/vermensajesnuevos?nick=marce_fing",
	  	//"url": "http://localhost:8080/Servidor/vermensajesnuevos?nick=marce_fing",
		"url": getUrl("vermensajesnuevos?nick=marce_fing"),
	  	"method": "GET",
		"headers": {
			"Access-Control-Allow-Origin": "*",
			"cache-control": "no-cache",
		}
	}
					
	$.ajax(settings).done(function (response) {
		var msjs= response.mensajes;
		if (msjs.length > 0){
		$.each(msjs, function (index, item) {
			var dateStr = JSON.parse(item.fecha);          
			var date = new Date(dateStr);
			
    		var eachrow = "<tr>"
                + "<td nowrap> <a id=" + item.id + " href=#>" + item.remitente + "</a></td>"
                + "<td nowrap>" + item.asunto + "</td>"
                + "<td nowrap>" + date.toDateString() + "</td>"
                + "</tr>";
    		$('#tbodynuevos').append(eachrow);
    		
   			var url = "Mensaje.jsp?source=" + item.id;
   			$("#"+item.id).attr("href",url);
		});
		} else{
			var eachrow = "<tr> <td width=200>No hay mensajes nuevos</td> <td></td> <td></td> </tr>";
			$('#tbodynuevos').append(eachrow);
			}

	});	


//------------cargar mensajes viejos-------------------
	var settings2 = {
		"async": true,
		"crossDomain": true,
		//"url": "http://servidorgrupo8.azurewebsites.net/Servidor/vermensajesviejos?nick=marce_fing",
	  //"url": "http://localhost:8080/Servidor/vermensajesviejos?nick=marce_fing",
		"url": getUrl("vermensajesviejos?nick=marce_fing"),
		"method": "GET",
		"headers": {
			"Access-Control-Allow-Origin": "*",
			"cache-control": "no-cache",
		}
	}

	$.ajax(settings2).done(function (response) {		
		var msjs2= response.mensajes;
		//alert("hola");
		
		if (msjs2.length > 0){
		$.each(msjs2, function (index, item) {
			var dateStr = JSON.parse(item.fecha);          
			var date = new Date(dateStr);
			//alert(date);
			
  			var eachrow = "<tr>"
              + "<td nowrap> <a id=" + item.id + " href=#>" + item.remitente + "</a></td>"
              + "<td nowrap>" + item.asunto + "</td>"
              + "<td nowrap>" + date.toDateString() + "</td>"
              + "</tr>" ;
              
  			$('#tbodyviejos').append(eachrow);
  
  			var url = "Mensaje.jsp?source=" + item.id;
    		$("#"+item.id).attr("href",url);
    		
		});
		} else{
			var eachrow = "<tr> <td width=200>No hay mensajes viejos</td> <td></td> <td></td> </tr>";
			$('#tbodyviejos').append(eachrow);
		}
	});	
	
	
	//------------cargar reportes nuevas-------------------
	var settings2 = {
		"async": true,
		"crossDomain": true,
		"url": getUrl("verreportesnuevos?nick=marce_fing"),
		"method": "GET",
		"headers": {
			"Access-Control-Allow-Origin": "*",
			"cache-control": "no-cache",
		}
	}

$.ajax(settings2).done(function (response) {		
	var rep1= response.mensajes;
		
	if (rep1.length > 0){
		$.each(rep1, function (index, item) {
			var dateStr = JSON.parse(item.fecha);          
			var date = new Date(dateStr);
			//alert(date);
			var url = "Mensaje.jsp?source=" + item.id;
			
			var eachrow = "<tr data-href=" + url + ">"
			+ "<td nowrap>" + item.remitente + "</a></td>"
			+ "<td nowrap>" + item.asunto + "</td>"
			+ "<td nowrap>" + date.toDateString() + "</td>"
			+ "</tr>";
              
  			$('#tbodyrepnuevos').append(eachrow);
  
  			$('tr[data-href]').on("click", function() {
  				document.location = $(this).data('href');
  			});
		});
		} else{
			var eachrow = "<tr> <td width=200>No hay reportes nuevos</td> <td></td> <td></td> </tr>";
			$('#tbodyrepnuevos').append(eachrow);
		}
	});	
	
	
	//------------cargar reportes viejos-------------------
	var settings2 = {
		"async": true,
		"crossDomain": true,
		"url": getUrl("verreportesviejos?nick=marce_fing"),
		"method": "GET",
		"headers": {
			"Access-Control-Allow-Origin": "*",
			"cache-control": "no-cache",
		}
	}

	$.ajax(settings2).done(function (response) {		
		var rep2= response.mensajes;
			
		if (rep2.length > 0){
			$.each(rep2, function (index, item) {
				var dateStr = JSON.parse(item.fecha);          
				var date = new Date(dateStr);
				//alert(date);
				var url = "Mensaje.jsp?source=" + item.id;
				
				var eachrow = "<tr data-href=" + url + ">"
				+ "<td nowrap>" + item.remitente + "</a></td>"
				+ "<td nowrap>" + item.asunto + "</td>"
				+ "<td nowrap>" + date.toDateString() + "</td>"
				+ "</tr>";
	              
	  			$('#tbodyrepviejos').append(eachrow);
	  
	  			$('tr[data-href]').on("click", function() {
	  				document.location = $(this).data('href');
	  			});
			});
			} else{
				var eachrow = "<tr> <td width=200>No hay reportes nuevos</td> <td></td> <td></td> </tr>";
				$('#tbodyrepnuevos').append(eachrow);
			}
		});	
	
}

function Salir(){
	window.location.href = "login.html"
}

