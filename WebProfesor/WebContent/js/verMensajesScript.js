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
			
			var url = "Mensaje.jsp?source=" + item.id;
			
    		var eachrow = "<tr data-href=" + url + ">"
                + "<td nowrap>" + item.remitente + "</a></td>"
                + "<td nowrap>" + item.asunto + "</td>"
                + "<td nowrap>" + date.toDateString() + "</td>"
                + "</tr>";
    		$('#tbodynuevos').append(eachrow);
    		
    		$('tr[data-href]').on("click", function() {
  			    document.location = $(this).data('href');
  			});
    		
   			

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
			
			var url = "Mensaje.jsp?source=" + item.id;
			
  			var eachrow = "<tr data-href=" + url + ">"
              + "<td nowrap>" + item.remitente + "</td>"
              + "<td nowrap>" + item.asunto + "</td>"
              + "<td nowrap>" + date.toDateString() + "</td>"
              + "</tr>" ;
      
    		
  			$('#tbodyviejos').append(eachrow);
  			
  			$('tr[data-href]').on("click", function() {
  			    document.location = $(this).data('href');
  			});

  		});
		} else{
			var eachrow = "<tr> <td width=200>No hay mensajes viejos</td> <td></td> <td></td> </tr>";
			$('#tbodyviejos').append(eachrow);
		}
	});	
}

function Salir(){
	window.location.href = "login.html"
}

