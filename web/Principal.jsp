<%-- 
    Document   : Principal
    Created on : 01-feb-2019, 11:58:18
    Author     : YILMER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="objetos.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="objetos.Tarea"%>
<%@page import="objetos.Trabajador"%>
<%@ page import="java.util.Random"%>

<!DOCTYPE html>
<%
if (request.getSession().getAttribute("usuario") == null)
response.sendRedirect("index.jsp");
Date fechaActual = new Date();
%>

 <%!
        public int generateRandomNumber(int start, int end ){
        Random random = new Random();
        long fraction = (long) ((end - start + 1 ) * random.nextDouble());
        return ((int)(fraction + start));
       }
     %>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>CONTROL - BARBERIA ONLINE</title>
<script type="text/javascript" src="MD5.js"></script>
  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">
<script>
        $('document').ready(function(){ 
           
    var nameregex = /^[a-zA-Z ]+$/;

      $.validator.addMethod("validname", function( value, element ) {
     return this.optional( element ) || nameregex.test( value );
        }); 
        }
        </script>
     <script>
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>
  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="index.html">BarberiaOnline</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0" action="buscartarea.do"  method="post">
      <div class="input-group">
          
        <input type="text" name="usuarioname" class="form-control" placeholder="Escribe aqui un nombre" aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <!-- <span class="badge badge-danger">9+</span>-->
        </a>
      </li>
      <li class="nav-item dropdown no-arrow mx-1">
        
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <form action="salir.do" method="post" id="form-salir"><br />
          <center><img class="images" src="imagenes/icons8-puerta.png" ><input value="Salir" type="submit" class="btn btn-danger" /></center>
        </form>
        </div>
      </li>
    </ul>

  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="index.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>BarberiaOnline</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pages</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">Otros:</h6>
         <!-- <a class="dropdown-item" href="registrar.jsp">Registrar Trabajador</a>
          <a class="dropdown-item" href="OpcionesAvanzadas.jsp">Opciones Avanzadas</a>-->
          <div class="dropdown-divider"></div>
          <h6 class="dropdown-header">Other Pages:</h6>
          <a class="dropdown-item" href="404.html">none</a>
          <a class="dropdown-item" href="blank.html">none</a>
        </div>
      </li>
      <a  class="nav-link"  class="ok" name="ok">
     <!-- <li class="nav-item" >
        
          <i class="fas fa-fw fa-chart-area" ></i>
          <span>Graficos</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="OpcionesAvanzadas.jsp">
          <i class="fas fa-fw fa-table"></i>
          <span>Tables</span></a>
      </li>-->
    </ul>

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">OpcionesBasicas</li>
        </ol>

        <!-- Icon Cards-->
        <div class="row">
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fa fa-search"></i>
                </div>
                <div class="mr-5">Citas de Hoy!</div>
                <form action="mostrartareas.do" method="post"  >  
                <center><h3><span class="label label-warning">Fecha [año-mes-dia]</span></h2><input type="date"  style="width:150px" name="fechaTarea" step="1"  value="<%=String.format("%tY-%tm-%td", fechaActual, fechaActual, fechaActual)%>" /></center> <br/>
                <br> <center><input value="Mostrar tareas de esta fecha" type="submit" class="btn btn-success" /></center><br />
           </form>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="#">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-warning o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fa fa-calendar"></i>
                </div>
                <div class="mr-5">Todas las citas!</div>
                <form action="todastareas2.do" method="post" class="form"><br />
                <center><img class="images" src="imagenes/icons8-detalles.png" ><input value="Mostrar todas las tareas" type="submit" class="btn btn-success" /></center>
                </form>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="#">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          
            <%
    
               ArrayList<Tarea> tareas =(ArrayList)request.getSession().getAttribute("tareas");
              int tam = tareas.size();

            %>
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-danger o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-shopping-cart"></i>
                </div>
                <div class="mr-5">Ventas!</div>
                <span>fecha actual: <%=String.format("%tY-%tm-%td", fechaActual, fechaActual, fechaActual)%></span>
                <span>Citas Totales Reservadas: <%=tam%></span>
                <form action="autenticar.do" method="post">
                    <input name="loginUsuario" type="text" value="admin" style="visibility:hidden">
                    <input name="passwordUsuario" type="text" value="21232f297a57a5a743894a0e4a801fc3" style="visibility:hidden">
                    <center><input class="btn-primary" type="submit" value="Refresh BD"></center>
                    </form>
                
              </div>
              <a class="card-footer text-white clearfix small z-1" href="#">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
                 <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
              <div class="card-body">
                  <div class="card-body-icon">
                  <i class="fa fa-envelope"></i>
                </div> 
                  <div class="mr-5">Enviar Recordatorios</div>
                Emails!
              </div>
              <a class="card-footer text-white clearfix small z-1" href="#">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
        </div>
<!-- area de opciones avanzadas-->
<ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">OpcionesAvanzadas</li>
        </ol>
<div class="row">
<div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
              <div class="card-body">
                  <div class="card-body-icon">
                  <i class="fas fa-eraser"></i>
                </div>
                  <div class="mr-5">Eliminar Antiguos</div>
                <form action="borrarregistrosantiguos.do"  method="post">
              <input type="date" name="fechaActual" step="1" value="<%=String.format("%tY-%tm-%td", fechaActual, fechaActual, fechaActual)%>">
              <input type="submit" value="Borrar" class="btn btn-danger"> 
             </form>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="#">
                <span class="float-left">View Details</span>
                <span class="float-right">
                 
                </span>
              </a>
            </div>
          </div>
             <!-- recordatorios aqui-->
                  
</div>
    
     
    

        <!-- Area de formularios-->
        <div class="row">
            
            <div class="col-lg-6 mb-4">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Añadir trabajador</h6>
                </div>
                <div class="card-body">
                <form action="registrartrabajador.do" method="post">
               <div class="input-group"> <span class="input-group-addon">NumeroID</span> <input type="number" class="form-control" name="idTrabajador" ></div>
               <div class="input-group"><span class="input-group-addon">Nombres</span><input type="text" class="form-control"  name="nombresTrabajador"></div>
               <div class="input-group"><span class="input-group-addon">Apellidos</span><input type="text" class="form-control"  name="apellidosTrabajador"></div>
               <div class="input-group"><span class="input-group-addon">Email   </span><input type="text" class="form-control" for="email" name="direccionTrabajador"></div>
               <div class="input-group"><span class="input-group-addon">Telefono</span><input type="text" class="form-control"  name="telefonoTrabajador"></div>
              <!--<label>profesion: </label> <input type="text" class="inputstyle"  name="profesion"><br>-->
              <div class="input-group"><label class="input-group-addon">profesion o area:</label> <select name="profesion" type="text" class="form-control">
              <option value="ESTILISTA">Estilista</option>
              <option value="TATUADOR">tatuador</option>
              <option value="COSMETOLOGA">cosmetologo/a</option>
              <option value="BARBERO">barbero</option>
              <option value="MANICURISTA">Manicurista</option>
               </select></div>
              <div class="input-group"><span class="input-group-addon">User name</span><input type="text" class="form-control"  name="loginTrabajador"></div>
              <div class="input-group"><span class="input-group-addon">Password</span><input type="text" class="form-control" name="passwordTrabajador" ></div>
              <div class="input-group"><span class="input-group-addon">MD5</span><input type="password" name="password" class="form-control" ></div>
              <div class="input-group"><label class="input-group-addon">NivelAcceso:</label> <select name="nivelAcceso" type="text" class="form-control">
              <option value="administrador">admin</option>
              <option value="trabajador">trabajador</option>
               </select></div>
              <input type="submit" value="registrarTrabajador" class="btn btn-primary" />
                 </form>
                </div>
              </div>
            
            
        </div>
            <div class="col-lg-6 mb-4">

              <!-- Illustrations -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Añadir Servicio</h6>
                </div>
                <div class="card-body">
                  <div class="text-center">
                    <form action="agregarservicio.do"  method="post">
              <div class="input-group"> <span class="input-group-addon">ID Servicio</span> <input type="number" class="form-control" name="idServicio" value="<%=generateRandomNumber(10,88888)%>"></div>
              <div class="input-group"> <span class="input-group-addon">Nombre Servicio</span><input type="text" class="form-control"  name="nombreServicio"></div>
              <div class="input-group"> <span class="input-group-addon">Duracion hh:mm</span><input type="time" class="input-group-text"  name="duracion" value="00:00"></div>
              <div class="input-group"> <span class="input-group-addon">Costo </span><input type="text" class="input-group-text"  name="costo"></div>
              <div class="input-group"> <span class="input-group-addon">Profesion Asociada</span><select name="profesionAsociada" type="text">
              <option value="ESTILISTA">Estilista</option>
              <option value="TATUADOR">Tatuador</option>
              <option value="COSMETOLOGA">Cosmetologo/a</option>
              <option value="BARBERO">Barbero</option>
              <option value="MANICURISTA">Manicurista</option>
               </select></div>
              <br/><input type="submit" value="agregarservicio" class="btn btn-primary" />
                    </form>
                  </div>
                   </div>
              </div>

              

            </div>
            
            
        </div>
        
            
        
        <!-- DataTables Example -->
        
      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="vendor/chart.js/Chart.min.js"></script>
  <script src="vendor/datatables/jquery.dataTables.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="js/demo/datatables-demo.js"></script>
  <script src="js/demo/chart-area-demo.js"></script>

</body>

</html>
