/**
 * 
 */

function cargarEstadisticas(){


//------------cargar datos de estadisticas-------------------
	var settings = {
	  		"async": true,
	  		"crossDomain": true,
	  		//"url": "http://servidorgrupo8.azurewebsites.net/Servidor/verestadisticas",
			  //"url": "http://localhost:8080/Servidor/verestadisticas",
	  		"url":getUrl("verestadisticas"),
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
                + "<td> " + item.id_problema + "</td>"
                + "<td> " + item.nro_nivel + "</td>"
                + "<td> " + item.nombre_mundo + " </td>"
                +"<td> <a id=" + item.id_problema + " href=#>" + "link" + "</a>" + "</td>"
                + "<td> " + item.cant_intentos + " </td>"
                + "<td> " + item.cant_aciertos + " </td>"
                + "</tr>";
    		$('#tbodyestadisticas').append(eachrow);
    		
    		var url = "https://www.dropbox.com/home/" + item.url_problema;
    		$("#"+item.id_problema).attr("href",url);
    		
		});

	});	
	
	//------------cargar datos de ranking-------------------
	var settings = {
	  		"async": true,
	  		"crossDomain": true,
	  		"url": getUrl("verranking"),
	  		//"url": "http://servidorgrupo8.azurewebsites.net/Servidor/verranking",
			  //"url": "http://localhost:8080/Servidor/verranking",
	  		"method": "GET",
	  		"headers": {
	  			"Access-Control-Allow-Origin": "*",
	    		"cache-control": "no-cache",
	  			}
			}
			
	$.ajax(settings).done(function (response) {
		var estadisticas= response.listaPuntos;
		//alert("entra");
		$.each(estadisticas, function (index, item) {
			
    		var eachrow = "<tr>"
                + "<td> " + item.nick + " </td>"
                + "<td> " + item.puntos+ " </td>"
                + "</tr>";
    		$('#tbodyranking').append(eachrow);
    		
		});
	});		
	

}

function Salir(){
	window.location.href = "login.html"
}

