 <!DOCTYPE html>
<html lang="en">
 <head>
  <title>Agregar Nivel</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/global_source.js"></script>
  <script type="text/javascript" src="js/agregarNivelScript.js"></script>
 </head>

 <body onload="cagarMundos()" style="background-color:#75507b;color:#FFFFFF;">
  <jsp:include page="Header.jsp"></jsp:include>
  <div class="container">
   <h2 class= "col-sm-offset-3 col-sm-9">Informacion del nuevo nivel</h2>
   <form class="form-horizontal">
    <div class="form-group"></div>
     <div class="col-sm-offset-3 col-sm-4">
      <select id ="lista" class="form-control" onchange="habilitarCrear()">
       <option value ="">Seleccione el mundo</option>
	  </select>
	 </div>
     <div class="form-group"></div>
     <div class="form-group"></div>
     <div class="form-group"></div>
     <div class="form-group">
      <div class="col-sm-offset-3 col-sm-9">
        <button type="submit" onclick="AgregarNivel()" class="btn btn-default">Agregar nivel</button>
      </div>
    </div>
   </form>
  </div>
 </body>
</html>