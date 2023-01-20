<%-- 
    Document   : opcionesavanzadas
    Created on : 25-nov-2017, 15:16:13
    Author     : YILMER
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="objetos.Tarea"%>
<%@page import="objetos.Usuario"%>
<%@page import="objetos.Trabajador"%>
<%@page import="java.util.Date"%>
<%@ page import="java.util.Random"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="estilo.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>
            body {background-color: #e2e6ea;}
            .inputstyle {font-size: 8pt; size: auto;}
         </style>
<title>Agenda Web</title>
</head>
<body>
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
     <div class="wrapper">
        <div class="container">
        	<div class="row">
                <div class="col-md-12">
                <header id="header">

       <div class="slider">
               <nav class="navbar navbar-default">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">

                          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#mainNav">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                          </button>
                          
                         <a class="jaja" href="#"><img class="avatar" src="imagenes/icons8-admin-96.png"></a>
                         <!-- <a class="navbar-brand" href="#"><img class="img-responsive" src="http://rolyart.ro/wp-content/uploads/2016/07/roland-maruntelu-freelancer-romania.jpg"></a>-->
                          <span class="site-name"><b><%=((Usuario)request.getSession().getAttribute("usuario")).getNombresUsuario()%>   <%=((Usuario)request.getSession().getAttribute("usuario")).getApellidosUsuario()%></b></span>
                          <span class="site-description">Bienvenido a su agenda en la WEB</span>
                        </div>
                        </div>
                           <div class="panel panel-primary">
                      <div class="collapse navbar-collapse" id="mainNav" >
               <ul class="nav main-menu navbar-nav">
                <li><a href="inicio.jsp"><i class="fa fa-home"></i> HOME</a></li>
               <!-- <li><a href="agregartarea.jsp">Agregar a agenda</a></li>-->
                <li><a href="tareas2.jsp">Toda mi agenda</a></li>
                <li><a href="index.jsp" >Salir</a></li>
                 </ul>
                   </div>
               </div>
           <div class="panel-body"></div>
      </div>   
             
    
<center><h2>Agenda Web</h2></center>
<title>Opciones.</title>
<div class="table-responsive">
<table class="table">
        
            <tr>
                <td>
              <h3><span class="label label-success">Limpiar Registros de citas Anteriores a Hoy!</span></h3>
             <form action="borrarregistrosantiguos.do"  method="post">
              <input type="date" name="fechaActual" step="1" value="<%=String.format("%tY-%tm-%td", fechaActual, fechaActual, fechaActual)%>">
              <input type="submit" value="Borrar" class="btn btn-primary"> 
             </form>
                <br /><a href="Email.jsp">ENVIAR CORREO DE RECORDATORIO</a>
                </td>
            </tr>
            <tr>
                <td>
              <h3><span class="label label-success">Agregar Trabajador!</span></h3>
             <form action="registrartrabajador.do"  method="post">
              <label>numeroId:  </label> <input type="number" class="inputstyle" name="idTrabajador" ><br>
              <label>Nombres:   </label> <input type="text" class="inputstyle"  name="nombresTrabajador"><br>
              <label>Apellidos  </label> <input type="text" class="inputstyle"  name="apellidosTrabajador"><br>
              <label>Direccion: </label> <input type="text" class="inputstyle"  name="direccionTrabajador"><br>
              <label>Telefono:  </label> <input type="text" class="inputstyle"  name="telefonoTrabajador"><br>
              <!--<label>profesion: </label> <input type="text" class="inputstyle"  name="profesion"><br>-->
              <label>profesion o area:</label> <select name="profesion" type="text">
              <option value="estilista">Estilista</option>
              <option value="tatuador">tatuador</option>
              <option value="cosmeloga">cosmetologo/a</option>
              <option value="barbero">barbero</option>
              <option value="manicurista">Manicurista</option>
               </select><br>
              <label>User name: </label> <input type="text" class="inputstyle"  name="loginTrabajador"><br>
              <label>Password:  </label> <input type="password" class="inputstyle" name="passwordTrabajador"><br>
              <label>acceso: </label> <input type="text" class="inputstyle"  name="nivelAcceso" value="administrador"><br>
              
              <br/><input type="submit" value="registrarTrabajador" class="btn btn-primary" />
             </form>
                </td>
                <td>
                    <%!
    public int generateRandomNumber(int start, int end ){
        Random random = new Random();
        long fraction = (long) ((end - start + 1 ) * random.nextDouble());
        return ((int)(fraction + start));
    }
%>
                    <h3><span class="label label-success">Agregar Servicio</span></h3>
             <form action="agregarservicio.do"  method="post">
              <label>IdServicio:  </label> <input type="number" class="inputstyle" name="idServicio" value="<%=generateRandomNumber(10,88888)%>"><br>
              <label>Nombre Servicio:   </label> <input type="text" class="inputstyle"  name="nombreServicio"><br>
              <label>duracion  </label> <input type="time" class="inputstyle"  name="duracion"><br>
              <label>costo: </label> <input type="text" class="inputstyle"  name="costo"><br>
              <label>profesion aseociada:</label> <select name="profesionAsociada" type="text">
              <option value="estilista">Estilista</option>
              <option value="tatuador">Tatuador</option>
              <option value="cosmetologa">Cosmetologo/a</option>
              <option value="barbero">Barbero</option>
              <option value="manicurista">Manicurista</option>
               </select><br>
              <br/><input type="submit" value="agregarservicio" class="btn btn-primary" />
                </td>
            </tr>
        </center>
</table>
             
<div class="callout">
  <div class="callout-header">Mensajes Header</div>
  <span class="closebtn" onclick="this.parentElement.style.display='none';">×</span>
  <div class="callout-container">
    <p>Some text to describe the callout message. <a href="#">Learn more</a> or close it if it is in your way.</p>
  </div>
</div>
    </body>
</html>
