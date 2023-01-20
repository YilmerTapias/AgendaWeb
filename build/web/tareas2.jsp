<%-- 
    Document   : tareas2
    Created on : 23-nov-2017, 0:48:55
    Author     : YILMER
--%>

<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="objetos.Tarea"%>
<%@page import="objetos.Usuario"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%

if (request.getSession().getAttribute("usuario") == null)
response.sendRedirect("index.jsp");
Date fechaActual = new Date();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
       <!-- <link href="css/bootstrap.min.css" rel="stylesheet">-->
       <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
        <style>
            body {background-color: #e2e6ea;}
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
    
    <script>
      function mifuncion() {
          
        var home = "<%=((Usuario)request.getSession().getAttribute("usuario")).getLoginUsuario()%>";
        var hola = String(home);
        if(home!="admin"){
            //document.getElementById('home').href = "inicio.jsp";
             location.href="indexUsuarios.jsp";
           
        }else{
            location.href="inicio.jsp";
        }}
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
                          <span class="site-description">Bienvenido a toda la agenda BarberOnline</span>
                        </div>
                        </div>
                           <div class="panel panel-primary">
                      <div class="collapse navbar-collapse" id="mainNav" >
               <ul class="nav main-menu navbar-nav">
                <li><a id="home" onclick="mifuncion()"><i class="fa fa-home"></i> HOME</a></li>
                <li><a href="agregartarea.jsp">Agregar a agenda</a></li>
                <li><a href="tareas2.jsp">Toda mi agenda</a></li>
                <li><a href="index.jsp" >Salir</a></li>
                 </ul>
                   </div>
               </div>
           <div class="panel-body"></div>
      </div>    
                          
                 
<center><h2>Agenda Web Completa</h2></center>
<br />
<br />
<%
    
ArrayList<Tarea> tareas =(ArrayList)request.getSession().getAttribute("tareas");
if (tareas.size() > 0) {
%>

<!--<a href="inicio.jsp">Inicio</a>-->
<form action="borrarregistros.do" method="post">
      <center><input value="Borrar todo" type="submit" class="btn btn-danger" /></center>
    </form><br />
    <form action="mostrarcitashoy.do" method="post">
        
      <center>Elija fecha<input type="date" name="fechaTarea" step="1" min="<%=fechaActual%>" value="<%=String.format("%tY-%tm-%td", fechaActual, fechaActual, fechaActual)%>">  
          <input value="VER CITAS DE ESTA FECHA" type="submit" class="btn btn-success" /></center>
    </form><br />
<div class="table-sresponsive">
<table border="1" class="table">
<tr>
<th bgcolor="#16A085"><center>Descripcion</center></th>
<th bgcolor="#16A085">Fecha</th>
<th bgcolor="#16A085">Hora-Inicio</th>
<th bgcolor="#16A085">Hora-Fin</th>
</tr>
</div>
<%
    String temp="null";
    String cod="none";
for (Tarea t : tareas) {
    
%>
<tr>
<td><%=t.getDescripcionTarea()%></td>
<td><%=t.getFechaTarea()%></td>
<td><%=t.getHoraTarea()%></td>
<td><%=t.getHoraFinal()%></td>
</tr>
<%
 
}

request.removeAttribute("fecha");
request.removeAttribute("tareas");
%>

</table>
<%
}

else {
%>
<h3>No hay tareas programadas</h3>
<%
}
%>

</body>
</html>