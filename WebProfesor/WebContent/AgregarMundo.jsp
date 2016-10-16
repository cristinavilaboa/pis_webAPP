<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/fileinput.min.css">
<link rel="stylesheet" type="text/css" href="loginStyle.css" media="screen" />
<link rel="stylesheet" type="text/css" href="PopUpStyle.css" media="screen" />
<title>Agregar Mundo</title>
</head>
<script type="text/javascript">

/****FUNCION PARA GUARDAR LA IMAGEN DEL MUNDO EN DROPBOX****/
function guardarImagen(){
	var fileInput = document.getElementById('input-1');
	var file = fileInput.files[0];
	var nom = file.name;
	var formData = new FormData();
	formData.append("archivo", file);
	var settings = {
			  "async": true,
			  "crossDomain": true,
			  "url": "https://content.dropboxapi.com/1/files_put/auto/Mundos/"+nom,
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
		 	var datos = JSON.parse(response);
			var path = datos.path;
			var p = path.replace("/","");
		  	guardarMundo(p);
		});
}

/****FUNCION PARA GUARDAR EL MUNDO EN EL SERVIDOR****/
function guardarMundo(path){
	//alert("entre al guardar");
	var nombre = $('#nombre').val();
	var exp = $('#experiencia').val();
	var desc = $('#descripcion').val();
	var settings = {
			  "async": true,
			  "crossDomain": true,
			  //"url": "http://localhost:8080/Servidor/agregarmundo?nombre=" + nombre + "&imagen=" + path + "&exp=" + exp + "&desc=" + desc,
			  "url": "http://servidorgrupo8.azurewebsites.net/Servidor/agregarmundo?nombre=" + nombre + "&imagen=" + path + "&exp=" + exp + "&desc=" + desc,
			  "method": "POST",
			  "headers": {
			    "cache-control": "no-cache",
			    "Access-Control-Allow-Origin": "*",
			  }
			}

			$.ajax(settings).done(function (response) {
			  //alert("agregobien");
			  location.href="Menu.html";
			});
}

</script>
<body>
<div class="login-page" style="width: 720px">
<div class="form" style="height:500px; width: 800px; max-width: 900px">
		<form action="Menu.html">
			<button style="width:25%; padding: 5px; text-align: center; margin-top: 1px; margin-right: 2px; position:absolute; top:0; right:0; font-size:12px; text-transform:none;" >Menú Principal</button>
		</form>
			<h2>Complete la información para crear el nuevo Mundo</h2>
    	<table width="100%" border="0" cellpadding="5">
    	<tr>
    	<td>
	    <div style="width: 100%;">
    		<label class="control-label">Seleccione la imagen del mundo</label>
			<input id="input-1" type="file" class="file" width="50px">
    	</div>
		</td>
		<td>
		<div>
		<label>Nombre</label>
    	<input id="nombre">
    	<br><br>
    	<label>Experiencia </label>
    	<input id ="experiencia"></input>
    	</div>
    	</td>
		<td>
		<div>
		<label>Descripcion del Mundo</label>
    	<textarea id ="descripcion" rows="5"></textarea>
    	</div>
    	</td>
    	</tr>
    	</table>
    	<button class="estilonuestro" onclick="guardarImagen()" style="width:200px">Agregar Mundo</button>
</div>
</div>

<script src="bootstrap/js/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/fileinput.min.js"></script>
</body>
</html>