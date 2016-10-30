 <!DOCTYPE html>
<html lang="en">
 <head>
  <title>Agregar Problema</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 </head>

  <script type="text/javascript" src="../js/global_source.js"></script>
  <script type="text/javascript" src="../js/nuevaPreguntaScript.js"></script>
  <script type="text/javascript" src="../js/header.js"></script>

<body id="addProblema" onload="cargarMundos()" style="background-color:#75507b;color:#FFFFFF;">
  <jsp:include page="Header.jsp"></jsp:include>
  <div class="container">
   <h2 class= "col-sm-offset-3 col-sm-9">Seleccione el mundo y nivel del nuevo problema</h2>
   <form class="form-horizontal">
    <div class="form-group"></div>
     <div class="col-sm-offset-3 col-sm-4">
      <select id ="lista" class="form-control" onchange="cargarNiveles()">
       <option value ="">Seleccione el mundo</option>
	  </select>
	 </div>
	 <div class="form-group"></div>
     <div class="form-group"></div>
     <div class="col-sm-offset-3 col-sm-4">
       <select id ="lista2" class="form-control" onchange="habilitarCrear()" size="1">
		<option value = "">Seleccione el nivel</option>
	   </select> 
	  </div>
     <div class="form-group"></div>
      <div class="form-group"></div>
     <div class="form-group">
      <div class="col-sm-offset-3 col-sm-9">
        <button id="crearP" type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" disabled="disabled">Continuar</button>
      </div>
    </div>
   </form>
  
  <div id="myModal" class="modal fade" role="dialog" style="color: #75507b">
  <div class="modal-dialog">
    <div class="modal-content">
     <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal">&times;</button>
      <h4 class="modal-title" align="center">Complete los siguientes datos:</h4>
     </div>
     <div class="modal-body">
      <form class="form-horizontal">
       <div class="form-group"></div>
       <div class="form-group">
        <label class="control-label col-sm-offset-1 col-sm-2" for="imagenP">Imagen:</label>
        <div class="col-sm-7">
    		<input type="text" class="form-control" id="imagenP" required="required" placeholder="Ingrese la URL de la imagen del problema">
       </div>
       </div>
	   <div class="form-group"></div>
       <div class="form-group">
      	<label class="control-label col-sm-offset-1 col-sm-2" for="descripcion">Descripcion:</label>
      	<div class="col-sm-7">
         <input type="text" class="form-control" id="descripcion" required="required" placeholder="Ingrese una descripcion para el problema">
      	</div>
       </div>
       <div class="form-group"></div>
       <div class="form-group">
       <label class="control-label col-sm-offset-1 col-sm-2" for="puntaje">Puntaje:</label>
       <div class="col-sm-7">
        <input type="number" min="0" class="form-control" id="puntaje" required="required" placeholder="Ingrese un puntaje para el problema">
       </div>
      </div>
      <div class="form-group"></div>
      <div class="form-group">
       <label class="control-label col-sm-offset-1 col-sm-2" for="respuesta">Respuesta:</label>
       <div class="col-sm-7">
        <input type="text" class="form-control" id="respuesta" required="required" placeholder="Ingrese una respuesta para el problema">
       </div>
      </div>
      <div class="form-group"></div>
      <div class="form-group">
       <label class="control-label col-sm-offset-1 col-sm-2" for="ayuda">Ayuda:</label>
       <div class="col-sm-7">
        <input type="text" class="form-control" id="ayuda" required="required" placeholder="Ingrese una ayuda para el problema">
       </div>
      </div>
      <div class="form-group"></div>
      <div class="form-group">
       <div class="col-sm-offset-3 col-sm-9">
        <button type="submit" onclick="guardarProblema()" class="btn btn-default" role=""data-dismiss="modal">Agregar problema</button>
       </div>
      </div>
     </form>
    </div>
   </div>
  </div>
   </div>
</div>
  
</body>
</html>