<%-- 
    Document   : tareas
    Created on : 23-nov-2017, 0:48:55
    Author     : YILMER
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="objetos.Tarea"%>
<%@page import="objetos.Usuario"%>
<%@page import="objetos.Grupo" %>
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
        <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>
            body {background-color: #e2e6ea;}
         </style>
        
<title>BarberiaOnline</title>
</head>
<body>
    <script>
      function mifuncion() {
         
        var home = "<%=((Usuario)request.getSession().getAttribute("usuario")).getLoginUsuario()%>";
        var hola = String(home);
        console.log(hola);
        if(home=="admin"){
            //document.getElementById('home').href = "inicio.jsp";
             location.href="inicio.jsp";
            console.log("entro");
        }else
        {
            location.href="indexUsuarios.jsp";
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
                          <span class="site-description">Bienvenido a su agenda en la WEB</span>
                        </div>
                        </div>
                           <div class="panel panel-primary">
                      <div class="collapse navbar-collapse" id="mainNav" >
               <ul class="nav main-menu navbar-nav">
                <li ><a id="home" onclick="mifuncion()"><i class="fa fa-home"></i> HOME</a></li>
                <li><a href="agregartarea.jsp" >Agregar a agenda</a></li>
                <li><a href="tareas2.jsp">Toda mi agenda</a></li>
                <li><a href="index.jsp" >Salir</a></li>
                 </ul>
                   </div>
               </div>
           <div class="panel-body"></div>
      </div>   
             
 <%
 String username = (String)request.getAttribute("names");

%>   

<%
ArrayList<Tarea> tareas =(ArrayList)request.getSession().getAttribute("tareas");
if (tareas.size() > 0) {
%>
<center><h2><font face="Comic Sans MS,arial,verdana">Mi Citas: <%=((Usuario)request.getSession().getAttribute("usuario")).getLoginUsuario()%></font></h2></center>
 <!-- <form action="borrarregistrofecha.do" method="post"><br />
    <input value="Borrar todo" type="submit" class="btn btn-danger" />
    </form><br />-->
<div class="table-responsive">
<table border="1" class="table" color="#ffff">
    <thead class="thead-inverse">  
<tr>  
<th bgcolor="#16A085">Descripcion</th>
<th bgcolor="#16A085">Fecha</th>
<th bgcolor="#16A085">Hora Inicio</th>
<th bgcolor="#16A085">Hora Fin</th>
</tr>
</thead> 
</div>
<%
for (Tarea t : tareas) {
    if(t.getFechaTarea().compareTo(String.format("%tY-%tm-%td", fechaActual, fechaActual, fechaActual)) < 0 ){
    System.out.println("cita vencido: "+t.getFechaTarea());
    
%>
<tr bgcolor="#FADBD8">
<td><%=t.getDescripcionTarea()%></td>
<td><%=t.getFechaTarea()%></td>
<td><%=t.getHoraTarea()%></td>
<td><%=t.getHoraFinal() %></td>
</tr>

<%
    }else{
%>
<tr bgcolor="#D1F2EB">
<td><%=t.getDescripcionTarea()%></td>
<td><%=t.getFechaTarea()%></td>
<td><%=t.getHoraTarea()%></td>
<td><%=t.getHoraFinal() %></td>
</tr>
<%
}
}

request.removeAttribute("fecha");
request.removeAttribute("tareas");
%>

</table></div>
<%
}
else {
%>
<div>
    <center><h3><img src="imagenes/LOL_48px.png" />¡Muy bien! No hay citas pendientes</h3></center>
</div>
<%
}
%>

</body>
</html>

