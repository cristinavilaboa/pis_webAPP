/**
 * 
 */

$(document).ready(function() {

	  $("#lista").change(function() {
	    var el = $(this) ;
	    $("#lista2").append("<option>SHIPPED</option>");
	  });

});

/****FUNCION PARA TRAER LOS MUNDOS DESDE EL SERVIDOR****/
function cargarMundos(){
	var settings = {
			  "async": true,
			  "crossDomain": true,
			  //"url":"http://localhost:8080/Servidor/listarmundosprofesor",
			  //"url": "http://servidorgrupo8.azurewebsites.net/Servidor/listarmundosprofesor",
			  "url": getUrl("listarmundosprofesor"),
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
/****FUNCION PARA TRAER LOS NIVELES DEL MUNDO SELECCIONADO DESDE EL SERVIDOR****/

function cargarNiveles(){
		var id_mundo = $('#lista').val();
		//alert(id_mundo);

		var settings = {
			  "async": true,
			  "crossDomain": true,
			  //"url": "http://localhost:8080/Servidor/listarnivelesmundoprofesor?id_mundo="+id_mundo,
			  //"url": "http://servidorgrupo8.azurewebsites.net/Servidor/listarnivelesmundoprofesor?id_mundo="+id_mundo,
			  "url": getUrl("listarnivelesmundoprofesor?id_mundo="+id_mundo),
			  "method": "GET",
			  "headers": {
			    "cache-control": "no-cache",
			    "Access-Control-Allow-Origin": "*",
			  }
			}

			$.ajax(settings).done(function (response) {
				var niveles= response;
				$('#lista2').empty();
				var celldefault = $('<option>');
				celldefault.val("");
				celldefault.text("Seleccione el nivel");
				$('#lista2').append(celldefault);
				for(i = 0;i<niveles.lista.length ;i++){
					var cell = $('<option>');
					cell.val(niveles.lista[i].id_nivel); //este es el que voy a usar para guardar el problema
					cell.text(niveles.lista[i].num_nivel);
					$('#lista2').append(cell);
				}
			});
};

/****FUNCION PARA GUARDAR LA PREGUNTA EN DROPBOX****/
function guardarPregunta(){
	var fileInput = document.getElementById('input-1');
	var file = fileInput.files[0];
	var nom = file.name;
	var formData = new FormData();
	formData.append("archivo", file);
	var settings = {
			  "async": true,
			  "crossDomain": true,
			  "url": getDUrl("Preguntas/"+nom),
			  "method": "PUT",
			  "headers": {
			    "authorization": "Bearer 1tfe4ti31eAAAAAAAAAAG5czFEHm52Nz8-gUKW7Ji7lIbtDDUzka7FedQYY2eePG",
			    "cache-control": "no-cache"
			  },
			  "processData": false,
			  "contentType": false,
			  "mimeType": "multipart/form-data",
			  "data": file
			}

		$.ajax(settings).done(function (response) {
		  	//alert("holaaaaaa")
		 	var datos = JSON.parse(response);
		  	//alert(datos.path);
			var path2 = datos.path;
			var p = path2.replace("/","");
		  	guardarProblema(p);
		  	//guardarProblema(datos.path);
		});
}
/****FUNCION PARA GUARDAR EL PROBLEMA EN EL SERVIDOR****/
function guardarProblema(path){
	//alert("entre al guardar");
	var mundo = $('#lista').val();
	var nivel = $('#lista2 option:selected').html();
	var resp = $('#respuesta').val();
	var ayuda = $('#ayuda').val();
	var puntos = $('#puntaje').val();
	var desc = $('#descripcion').val();
	//alert(nivel);//+" "+nivel+" "+resp+" "+ayuda+" "+puntos+" "+desc+" "path);
	var settings = {
			  "async": true,
			  "crossDomain": true,
			  //"url": "http://localhost:8080/Servidor/agregarproblema?desc=" + desc + "&resp=" + resp + "&exp=" + puntos + "&ayuda=" + ayuda + "&cont=" + path + "&id_mundo=" + mundo + "&num_nivl=" + nivel + "&nick_prof=marce_fing",
			  //"url": "http://servidorgrupo8.azurewebsites.net/Servidor/agregarproblema?desc=" + desc + "&resp=" + resp + "&exp=" + puntos + "&ayuda=" + ayuda + "&cont=" + path + "&id_mundo=" + mundo + "&num_nivl=" + nivel + "&nick_prof=marce_fing",
			  "url": getUrl("agregarproblema?desc=" + desc + "&resp=" + resp + "&exp=" + puntos + "&ayuda=" + ayuda + "&cont=" + path + "&id_mundo=" + mundo + "&num_nivl=" + nivel + "&nick_prof=marce_fing"),
			  "method": "POST",
			  "headers": {
			    "cache-control": "no-cache",
			    "Access-Control-Allow-Origin": "*",
			  }
			}

			$.ajax(settings).done(function (response) {
			  //alert("agregobien");
			  $('#myModal').hide();
			  alert("Problema agregado");
			  location.href="index.html";
			});

}

function habilitarCrear(){
	$('#myBtn').attr('disabled', false);
}

function Salir(){
	window.location.href = "login.html"
}
