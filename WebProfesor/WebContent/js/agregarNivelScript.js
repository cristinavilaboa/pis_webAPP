/**
 * 
 */

/****FUNCION PARA TRAER LOS MUNDOS DESDE EL SERVIDOR****/
function cargarMundos(){
	var settings = {
			  "async": true,
			  "crossDomain": true,
			  //"url":"http://localhost:8080/Servidor/listarmundosprofesor",
			  //"url": "http://servidorgrupo8.azurewebsites.net/Servidor/listarmundosprofesor",
			  "url":getUrl("listarmundosprofesor"),
			  "method": "GET",
			  "headers": {
				"Access-Control-Allow-Origin": "*",
				"content-type": "application/json",
			    "cache-control": "no-cache"
			  }
			}

			$.ajax(settings).done(function (response) {
				var mundos= response;
				for(i = 0;i<mundos.lista_mundos.length ;i++){
					var valor = response.lista_mundos[i].nombre;
					var cell = $('<option>');
					cell.val(response.lista_mundos[i].id_mundo);
					cell.text(response.lista_mundos[i].nombre);
					$('#lista').append(cell);	
				}
				
			});
}

/****FUNCION PARA AGREGAR UN NIVEL AL MUNDO SELECCIONADO****/

function AgregarNivel(){
	var id_mundo = $('#lista').val();
	var settings = {
			  "async": true,
			  "crossDomain": true,
			  //"url": "http://localhost:8080/Servidor/agregarnivel?id_mundo=" + id_mundo,
			  //"url": "http://servidorgrupo8.azurewebsites.net/Servidor/agregarnivel?id_mundo=" + id_mundo,
			  "url": getUrl("agregarnivel?id_mundo=" + id_mundo),
			  "method": "POST",
			  "headers": {
			    "cache-control": "no-cache",
			    "Access-Control-Allow-Origin": "*",
			  }
			}

			$.ajax(settings).done(function (response) {
				alert("Nivel agregado");
			 	location.href="index.html";
			});
}

function habilitarCrear(){
	$('#myBtn').attr('disabled', false);
}

function Salir(){
	window.location.href = "login.html"
}
