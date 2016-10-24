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

function Salir(){
	window.location.href = "login.html"
}

