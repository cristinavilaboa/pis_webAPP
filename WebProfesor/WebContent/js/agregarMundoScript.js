/**
 * 
 */
/****YA NO SE USA****/
/****FUNCION PARA GUARDAR LA IMAGEN DEL MUNDO EN DROPBOX****/

//function guardarImagen(){
//	var fileInput = document.getElementById('input-1');
//	var file = fileInput.files[0];
//	var nom = file.name;
//	var formData = new FormData();
//	formData.append("archivo", file);
//	var settings = {
//			  "async": true,
//			  "crossDomain": true,
//			  "url": getDUrl("Mundos/" + nom),
//			  "method": "PUT",
//			  "headers": {
//			    "authorization": "Bearer 1tfe4ti31eAAAAAAAAAAG5czFEHm52Nz8-gUKW7Ji7lIbtDDUzka7FedQYY2eePG",
//			    "cache-control": "no-cache"
//			  },
//			  "processData": false,
//			  "contentType": false,
//			  "mimeType": "multipart/form-data",
//			  "data": file
//			}
//
//		$.ajax(settings).done(function (response) {
//		 	var datos = JSON.parse(response);
//			var path = datos.path;
//			var p = path.replace("/","");
//		  	guardarMundo(p);
//		  	alert("Mundo agregado");
//		  	location.href="index.html";
//		});
//}

/****FUNCION PARA GUARDAR EL MUNDO EN EL SERVIDOR****/
function guardarMundo(){
	//alert("entre al guardar");
	var nombre = $('#nombre').val();
	var exp = $('#experiencia').val();
	var desc = $('#descripcion').val();
	var URLimagen = $('#imagen').val();
	var settings = {
			  "async": true,
			  "crossDomain": true,
			  //"url": "http://localhost:8080/Servidor/agregarmundo?nombre=" + nombre + "&imagen=" + path + "&exp=" + exp + "&desc=" + desc,
			  //"url": "http://servidorgrupo8.azurewebsites.net/Servidor/agregarmundo?nombre=" + nombre + "&imagen=" + path + "&exp=" + exp + "&desc=" + desc,
			  "url": getUrl("agregarmundo?nombre=" + nombre + "&imagen=" + URLimagen + "&exp=" + exp + "&desc=" + desc),
			  "method": "POST",
			  "headers": {
			    "cache-control": "no-cache",
			    "Access-Control-Allow-Origin": "*",
			  }
			}

			$.ajax(settings).done(function (response) {
			  //alert("agregobien");
			  location.href="VerEstadistica.jsp";
			});
}
