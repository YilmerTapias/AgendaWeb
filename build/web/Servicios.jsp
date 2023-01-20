<%-- 
    Document   : Servicios
    Created on : 27-ene-2019, 15:54:50
    Author     : YILMER
--%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@ page import="java.util.*" %>
<%@page import="objetos.Usuario"%>
<%@page import="objetos.Servicios"%>
<%@page import="objetos.Trabajador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
if (request.getSession().getAttribute("usuario") == null)
response.sendRedirect("index.jsp");
Date fechaActual = new Date();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
 <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
<!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">-->
  <link rel="stylesheet" href="estilo.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
  <style>
     body { background-color: #4e73df; }
     input[type="text"]{
         max-width: 40%;
         
     }
     .imagen img {
      width: 100%;
      height: 100%;
  }
  .bgimg {
    background-image: url('imagenes/Slider2.jpg');
}
  </style>
  <title>Agenda Web</title>
</head>
<body>
   
    
  <div class="wrapper">
        <div class="container">
        	<div class="row">
                <div class="col-md-12">
                    <header id="header">

       
                          <div class="panel panel-primary"  background>
                              <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <a class="navbar-brand" href="#">BarberiaOnline</a>
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="indexUsuarios.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="index.jsp">Salir</a>
      </li>
    </ul>
    <form method="post" action="listarservicios.do">
      <!--<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">-->
      <input class="btn btn-outline-success my-2 my-sm-0" type="submit" value="Agregar Cita">
    </form>
      
  </div>
</nav>
      <!--                   <div class="collapse navbar-collapse" id="mainNav" >
                           <form method="post" action="listarservicios.do">  
                          <ul class="nav main-menu navbar-nav">
                            <li><a href="indexUsuarios.jsp"><i class="fa fa-home"></i> HOME</a></li>
                            <li><a type="submit" onclick="$(this).closest('form').submit()" >Agregar Cita</a></li>
                            
                            <li><a href="index.jsp" >Salir</a></li>
                          </ul>
                               </form>
                              <div class="panel-body"><font face="Comic Sans MS,arial,verdana">BarberiaOnline - Nivel de acceso: Usuario</font></div>
         <br />
                               
  </div>-->
                            <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="imagenes/Slider.png" alt="First slide">
          <div class="container">
              <form method="post" action="listarservicios.do">
            <div class="carousel-caption">
              <!--<h1>Example headline.</h1>-->
              <p>Disfruta de nuestro servicio especial para hombre.</p>
              <p><a class="btn btn-lg btn-primary" onclick="$(this).closest('form').submit()" role="button">Reservar Especial</a></p>
            </div>
                  </form>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="imagenes/SliderWomen.png" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
         
              <p>Servicios para damas</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">IR</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="third-slide" src="imagenes/Slider2.png" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
                <p><a class="btn btn-lg btn-primary" href="#" role="button">Galeria</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
     <!--   <span class="sr-only">Previous</span>-->
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <!--  <span class="sr-only">Next</span>-->
      </a>
    </div><!-- /.carousel -->
    <center>
    <div class="container">  
        <div class="row"> 
            <div class="row cards" style="width: auto; margin: auto auto;">
 <div class="card" style="width: 18rem;">
  <img class="card-img-top" src="imagenes/CorteH1.png" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">HOMBRES</h5>
    <p class="card-text">Tintes,afeitado y Cortes de todo tipo para caballeros y niños.</p>
    <form method="post" action="listarservicios.do">
    <input type="submit" class="btn btn-primary" value="Rervar Servicio">
    </form>
  </div>
</div>                
       
  <div class="card" style="width: 18rem;">
  <img class="card-img-top" src="imagenes/depilacion.png" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">CUIDADO DEL ROSTRO</h5>
    <p class="card-text">Depilacion de cejas, vellos, mascarillas, maquillaje etc.</p>
    <form method="post" action="listarservicios.do">
    <input type="submit" class="btn btn-primary" value="Rervar Servicio">
    </form>
  </div>
</div>
        
  <div class="card" style="width: 18rem;">
  <img class="card-img-top" src="imagenes/mujer.png" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">DAMAS</h5>
    <p class="card-text">Tintes,planchado,peinados,cortes de cabello, manicure etc.</p>
    <form method="post" action="listarservicios.do">
    <input type="submit" class="btn btn-primary" value="Rervar Servicio">
    </form>
  </div>
  </div>
          </div>
           </div>
        </div>
    </center>

<!--<div class="table-sresponsive" >-->
   <%
  
   ArrayList<Servicios> serv =(ArrayList)request.getSession().getAttribute("servicios");
   //ArrayList<Trabajador> trab =(ArrayList)request.getSession().getAttribute("trabajadores");
   String[][] datos = new String[serv.size()][3];
   //String[][] datos2 = new String[trab.size()][2];
   
   String[][]  dat;
   dat = new String[serv.size()][3];
   if (serv.size() > 0) {
       
%> 
  <div class="card text-center">
  <div class="card-header">
    Tabla de Detalles
  </div>
  <div class="card-body">
<br>
<div class="table-responsive">
<table border="1" class="table" id="table">
<tr>
<th bgcolor="#16A085"><center>Nom servicio</center></th>
<th bgcolor="#16A085">Duracion</th>
<th bgcolor="#16A085">Costo</th>
<!--<th bgcolor="#16A085" name="OK" class="ok" >Seleccionar</th>-->
</tr>
</div>
   
  <%
    int i=0;
     int j=0;
   for (Servicios s : serv) {
       datos[i][0]=s.getNombreServicio();
          datos[i][1]=s.getDuracion();
          datos[i][2]=s.getCosto();
       
       System.out.println("arreglo pos "+i+datos[i][0]);
  %>
  
<tr>
<td><%=s.getNombreServicio()%></td>
<td><%=s.getDuracion()%></td>
<td><%=s.getCosto()%></td>
<!--<td id='select' class="btn btn-success" Onclick='butoms();'>select</td>-->
</tr>
<%
 i++; 
}
request.removeAttribute("servicios");
%>
</table>
<%
}


else {
%>
<h3>No hay Servicios disponibles</h3>
<%
}
%> 

     
    <h5 class="card-title">Trabajadores especializados</h5>
    <p class="card-text">para brindarte la mejor experiencia y el mejor servicio.</p>
   
  </div>
  <div class="card-footer text-muted">
    Company: RemliySoftware 
    || Developer Yilmer Tapias
  </div>
</div>  
</header>
</body>
</html>

