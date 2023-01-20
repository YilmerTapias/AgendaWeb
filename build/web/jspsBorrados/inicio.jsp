<%-- 
    Document   : inicio.jsp
    Created on : 23-nov-2017, 0:46:15
    Author     : YILMER
--%>

<%@page import="java.util.Date"%>
<%@page import="objetos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
if (request.getSession().getAttribute("usuario") == null)
response.sendRedirect("index.jsp");
Date fechaActual = new Date();
%>

<dependencies>
            <dependency>
                <groupId>com.sun.mail</groupId>
                <artifactId>javax.mail</artifactId>
                <version>1.6.2</version>
            </dependency>
        </dependencies>
<html>
               
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="estilo.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
     body {background-color: #0c5460;}
     input[type="text"]{
         max-width: 40%;
         
     }
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
                            <li><a href="OpcionesAvanzadas.jsp" >Opciones Avanzadas</a></li>                        
                            <li><a href="index.jsp" >Salir</a></li>
                          </ul>
                              <div class="panel-body">Agenda Web - Administrador</div>
         <br />
                               
  </div>
<center><h2>Agenda Web</h2></center>
<h3><span class="label label-success">Bienvenido a su agenda</span></h3>

   
  
   
  <title>Mi Busqueda.</title> 
        <center>
        <h3><span class="label label-success">Porfavor digite una palabra!</span></h3>
        <form action="buscartarea.do"  method="post">
            <input type="text" name="usuarioname"  placeholder="Escribe aqui un nombre">
          <input type="submit" value="Buscar" class="btn btn-primary"> 
       </form>
        </center>
<div class="table-responsive">
        <table class="table">
            <td>
       <form action="mostrartareas.do" method="post"  >  
    <center><h3><span class="label label-warning">Fecha [año-mes-dia]</span></h2><input type="date"  style="width:150px" name="fechaTarea" step="1"  value="<%=String.format("%tY-%tm-%td", fechaActual, fechaActual, fechaActual)%>" /></center> <br/>
     <br> <center><input value="Mostrar tareas de esta fecha" type="submit" class="btn btn-success" /></center><br />
           </form>
   </td>
     <td bgcolor="#D5D3D3">
   <form action="todastareas2.do" method="post" class="form"><br />
       <center><img class="images" src="imagenes/icons8-detalles.png" ><input value="Mostrar todas las tareas" type="submit" class="btn btn-success" /></center>
    </form>
   
        <form action="salir.do" method="post" id="form-salir"><br />
          <center><img class="images" src="imagenes/icons8-puerta.png" ><input value="Salir" type="submit" class="btn btn-danger" /></center>
        </form>
     </td>
       
           </table>
 </div>
 <a href="Principal.jsp"> DashBoard-Admin</a>
</script>
</body>
</html>
