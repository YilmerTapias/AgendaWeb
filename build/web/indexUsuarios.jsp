<%-- 
    Document   : indexUsuarios
    Created on : 12-oct-2018, 22:28:44
    Author     : YILMER
--%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="objetos.Tarea"%>
<%@page import="objetos.Usuario"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
if (request.getSession().getAttribute("usuario") == null)
response.sendRedirect("index.jsp");
Date fechaActual = new Date();
%>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>BARBERIA ONLINE</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

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
  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="">
        <div class="sidebar-brand-icon ">
          <!--<i class="fas fa-laugh-wink"></i>-->
          <img class="img-profile rounded-circle" src="imagenes/icons8-barber48.png">
        </div>
        <div class="sidebar-brand-text mx-3">Barberia Online </div>
        <div class="sidebar-brand-icon ">
          <!--<i class="fas fa-laugh-wink"></i>-->
          <img class="img-profile rounded-circle" src="imagenes/icons8-barber48.png">
        </div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="">
          <i class="fa fa-address-book-o"></i>
          <span>Barberia</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Paginado
      </div>

      <!-- Nav Item - paginas -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pages</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <form action="servicios.do" method="post">
            <input class="collapse-item" type="submit" value="Servicios">
            </form>
            <a class="collapse-item" href="MisCitas.jsp">Mis citas</a>
            
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>
<%
    
ArrayList<Tarea> tareas =(ArrayList)request.getSession().getAttribute("tareas");
int tam = tareas.size();

%>
            <!-- Nav Item - Alerts nortificaciones-->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <!-- Counter - Alerts -->
                <span class="badge badge-danger badge-counter"><%=tam %>+</span>
              </a>
              <!-- Dropdown - Alerts -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                  Notificaciones
                </h6>
                  
                
                    <%
                        if (tareas.size() > 0) {
                      String temp="null";
                      String cod="none";
                        for (Tarea t : tareas) {
    
                     %>
                     <a class="dropdown-item d-flex align-items-center" href="MisCitas.jsp">
                  <div class="mr-3">
                    <div class="icon-circle bg-primary">
                      <i class="fas fa-envelope fa-fw text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500"><%=t.getFechaTarea()%> De: <%=t.getHoraTarea()%> Hasta: <%=t.getHoraFinal()%></div>
                    <span class="font-weight-bold"><%=t.getDescripcionTarea() %></span>
                  </div>
                  <%
                        }

                         request.removeAttribute("fecha");
                          request.removeAttribute("tareas");
                    %>
                    <%
                         }
                          else {
                    %>
                    <a class="dropdown-item d-flex align-items-center" href="MisCitas.jsp">
                  <div class="mr-3">
                    <div class="icon-circle bg-primary">
                      <i class="fas fa-envelope fa-fw text-white"></i>
                    </div>
                  </div>
                    <div>
                    <div class="small text-gray-500"><%=fechaActual%></div>
                    <span class="font-weight-bold">Uested no tiene citas pendientes.</span>
                  </div>
                    <%
                    }
                    %>
                </a>
                  
                 
              
                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
              </div>
            </li>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=((Usuario)request.getSession().getAttribute("usuario")).getNombresUsuario()%>   <%=((Usuario)request.getSession().getAttribute("usuario")).getApellidosUsuario()%></span>
                <img class="img-profile rounded-circle" src="imagenes/icons8-user.png">
              </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <form action="salir.do" method="post" id="form-salir"><br />
          <center><img class="images" src="imagenes/icons8-puerta.png" ><input value="Salir" type="submit" class="btn btn-danger" /></center>
        </form>
        </div>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Te damos la bienvenida!!</h1>
            <form action="autenticar.do" method="post">
                <input name="loginUsuario" type="text" value="<%=((Usuario)request.getSession().getAttribute("usuario")).getLoginUsuario()%>" style="visibility:hidden">
                    <input name="passwordUsuario" type="text" value="<%=((Usuario)request.getSession().getAttribute("usuario")).getPasswordUsuario()%>" style="visibility:hidden">
            <input  type="submit" class="d-sm-inline-block btn btn-sm btn-primary shadow-sm" value="Refresh Datos"><i class="fas fa-download fa-sm text-white-50" ></i>
            </form>
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Card reservar -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Reservar cita</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      <form action="listarservicios.do" method="post">
                       <center><img class="images" src="imagenes/Calendar_48px.png" ><br />
                        <center><input value="Reservar" type="submit" class="btn btn-primary" /></center>
                      </form>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Servicios</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                          <form action="servicios.do" method="post">
                           <center><img class="images" src="imagenes/servicios.png" ><br />
                            <center><input value="Servicios" type="submit" class="btn btn-success" /></center>
                          </form>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Toda la Agenda</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                          <form action="todastareas2.do" method="post">
                           <center><img class="images" src="imagenes/icons8-bulleted-list-48.png" ><br />
                            <center><input value="Ver agenda" type="submit" class="btn btn-success" /></center>
                          </form>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Card mis citas -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Area Personal</div>
                      <span class="badge badge-danger badge-counter" ><%=tam%>+</span>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                          <form action="miscitas.do" method="post">
                           <center><img class="images" src="imagenes/icons8-form-48.png" ><br />
                           <input value="Area personal" type="submit" class="btn btn-primary" /></center>
                          </form>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          
          <!-- Content Row -->

          <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-12 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Servicios y Promociones</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    
                  </div>
                </div>
                <!-- Card Body -->
                <img src="imagenes/Slider2.png" >
            </div>
          </div>
</div>
          <!-- Content Row -->
          <div class="row">
<div class="container">  
        <div class="row"> 
            <div class="row cards" style="width: auto; margin: auto auto;">
 <div class="card" style="width: 18rem;">
  <img class="card-img-top" src="imagenes/CorteH1.png" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">HOMBRES</h5>
    <p class="card-text">Tintes,afeitado y Cortes de todo tipo para caballeros y niños.</p>
    <form method="post" action="listarservicios.do">
    <input type="submit" class="btn btn-primary" value="Reservar Servicio">
    </form>
  </div>
</div>                
       
  <div class="card" style="width: 18rem;">
  <img class="card-img-top" src="imagenes/depilacion.png" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">CUIDADO DEL ROSTRO</h5>
    <p class="card-text">Depilacion de cejas, vellos, mascarillas, maquillaje etc.</p>
    <form method="post" action="listarservicios.do">
    <input type="submit" class="btn btn-primary" value="Reservar Servicio">
    </form>
  </div>
</div>
        
  <div class="card" style="width: 18rem;">
  <img class="card-img-top" src="imagenes/mujer.png" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">DAMAS</h5>
    <p class="card-text">Tintes,planchado,peinados,cortes de cabello, manicure etc.</p>
    <form method="post" action="listarservicios.do">
    <input type="submit" class="btn btn-primary" value="Reservar Servicio">
    </form>
  </div>
  </div>
          </div>
           </div><br>
        </div>
            <!-- Content Column -->
            <div class="col-lg-12 mb-4">

              <!-- Project Card Example -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary"> Información del Local</h6>
                </div>
                <div class="card-body">
                  <center><h3><font face="Comic Sans MS,arial,verdana">Horarios y Ubicacion</font></h3></center>
                              <img style="float:left;" src="imagenes/marcador.png" ><h5><font face="Comic Sans MS,arial,verdana">Cl. 16 #20-2 a 20-30 |Montelibano Cordoba.</font></h5>
                              <br /><img style="float:left;" src="imagenes/reloj.png" ><h5><font face="Comic Sans MS,arial,verdana">08:30 am 11:30 y 02:00pm a 07:00 pm. lunes a sab</font></h5>        
                </div>
              </div>

              <!-- Color System -->
              <!--<div class="row">
                <div class="col-lg-6 mb-4">
                  <div class="card bg-primary text-white shadow">
                    <div class="card-body">
                      Primary
                      <div class="text-white-50 small">#4e73df</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-success text-white shadow">
                    <div class="card-body">
                      Success
                      <div class="text-white-50 small">#1cc88a</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-info text-white shadow">
                    <div class="card-body">
                      Info
                      <div class="text-white-50 small">#36b9cc</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-warning text-white shadow">
                    <div class="card-body">
                      Warning
                      <div class="text-white-50 small">#f6c23e</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-danger text-white shadow">
                    <div class="card-body">
                      Danger
                      <div class="text-white-50 small">#e74a3b</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-secondary text-white shadow">
                    <div class="card-body">
                      Secondary
                      <div class="text-white-50 small">#858796</div>
                    </div>
                  </div>
                </div>
              </div>-->

            </div>

            
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; RemliySoftware 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

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

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="js/demo/chart-area-demo.js"></script>
  <script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>
