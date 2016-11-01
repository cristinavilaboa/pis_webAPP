<!DOCTYPE html>
<html lang="en">
<head>
  <title>Header</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script>
    $(document).ready(function () {
        $('.dropdown-toggle').dropdown();
        
    });

</script>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header" align="center" >
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-left">
        <li>        <img src="../Imagenes/Logo.png" class="img-rounded" alt="Brand" width="90px" height="55px" ></li>
      </ul>
      <ul class="nav navbar-nav">
        <li>  <a> </a></li>
      </ul>
      <ul class="nav navbar-nav">
        <li><a href="index.jsp">Inicio</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Nuevo<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="AgregarMundo.jsp">Mundo</a></li>
            <li><a href="AgregarNivel.jsp">Nivel</a></li>
            <li><a href="AgregarProblema.jsp">Problema</a></li>
          </ul>
        </li>
        <li><a id="msj" href="VerMensajes.jsp">Mensajes</a></li>
        <li><a href="VerEstadisticas.jsp">Estadísticas</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="../login.jsp"><span class="glyphicon glyphicon-log-out"></span>SALIR</a></li>
      </ul>
    </div>
  </div>
</nav>

</body>
</html>