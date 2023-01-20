<%-- 
    Document   : agregartarea
    Created on : 23-nov-2017, 0:47:01
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
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<script src="js/bootstrap-datetimepicker.min.js"></script>
  <style>
        body {background-color: #e2e6ea;}
        .selected {
    background-color: MediumSpringGreen;
    color: #FFF;
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
                          <span class="site-description">Bienvenido BarberOnline</span>
                        </div>
                        </div>
                           


<div class="alert alert-info fade in">
    <a href="#" class="close" data-dismiss="alert">&times;</a>
    <strong>Note!</strong> Recuerde que el horario es de <strong>08:30am a 11:30am  y  02:00pm a 08:00pm</strong>.
</div>
                          
<div class="panel panel-primary">
      <div class="panel-heading">AGREGAR NUEVO EVENTO A TU AGENDA</div>
      <form action="registrartarea.do" method="post">
    <!--  <div class="panel-body">Fecha (aaaa-mm-dd) <input name="fechaTarea" value="<%=String.format("%tY-%tm-%td", fechaActual, fechaActual, fechaActual)%>" />
      Hora (hh:mm:ss AM/PM)</span> <input name="horaTarea" value="<%=String.format("%tI:%tM:%tS %Tp", fechaActual, fechaActual, fechaActual,fechaActual)%>" /><br />
    </div>-->
     
<br><label>Elija fecha de su cita:</label> <input type="date" name="fechaTarea" step="1" min="2013-01-01" value="<%=String.format("%tY-%tm-%td", fechaActual, fechaActual, fechaActual)%>">
<label>Hora inicio:</label> <input type="time" class="usr-time" name="horaTarea" value="08:30" id='horaIni'>

<!--Hora: <select name="horaTarea" type="time" id='horaini'>
  <option value="08:00">08:00</option>
  <option value="08:30">08:30</option>
  <option value="09:00">09:00</option>
  <option value="09:30">09:30</option>
  <option value="10:00">10:00</option>
  <option value="10:00">10:30</option>
  <option value="10:00">11:00</option>
  </select>-->

<%
  
   ArrayList<Servicios> serv =(ArrayList)request.getSession().getAttribute("servicios");
   ArrayList<Trabajador> trab =(ArrayList)request.getSession().getAttribute("trabajadores");
   String[][] datos = new String[serv.size()][3];
   String[][] datos2 = new String[trab.size()][2];
   
   String[][]  dat;
   dat = new String[serv.size()][3];
   if (serv.size() > 0) {
       
%>
   
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

//listar trabajadores

%>    

<script>
    $(document).ready(function(){
       $('#alerta').hide(); 
       $('#success').hide();
       $(":submit").attr("disabled", true);
       
    $("#table tr").click(function(){
   $(this).addClass('selected').siblings().removeClass('selected');    
   var value=$(this).find('td:first').html();
   alert(value); 
  //calcular datos
  var x=$(this).find('td');
  //alert(x);
  
  var HoraFinal= x[1].innerHTML;
                       document.getElementById("Duracion").value = HoraFinal
                       var horaIni=document.getElementById("horaIni");
                       var horaFin=document.getElementById("Duracion");
                      
                       var inicio=horaIni.valueAsDate;
                       var fin=horaFin.valueAsDate;
                       var s = (inicio.getTime() + fin.getTime());
                       var ms = s % 1000;
  	               s = (s - ms) / 1000;
  	               var secs = s % 60;
  	               s = (s - secs) / 60;
  	               var mins =  parseFloat(s % 60);
  	               var hrs =  parseFloat((s - mins) / 60);
                       //alert("inicio: "+hrs +":"+ mins);
                       mins = mins < 10 ? '0' + mins : mins;
                       hrs = hrs < 10 ? '0' + hrs : hrs;
                       var result = hrs + ":" + mins;
                       $(":submit").attr("disabled", true);
                       document.getElementById("duracion").value = result;
                        document.getElementById("nombre").value = x[0].innerHTML;
                        document.getElementById("costo").value = x[2].innerHTML;
                       // result < "11:31" && result >= "08:30" || result <= "20:00" && result >= "14:00"
                    
                      if( (horaIni.value >= "08:30" && result <= "11:30") || (horaIni.value >= "14:00" && result <= "20:00")){ 
                          $('#alerta').hide();
                          $('#success').show();
                          $(":submit").removeAttr("disabled");
                      }else{
                          $(":submit").attr("disabled", true);
                          $('#success').hide();
                          $('#alerta').show();
                      }
});

$('.ok').on('click', function(e){
    alert($("#table tr.selected td:first").html());
});

   });
       </script>



<script>  
</script>
</div>
duracion del servicio: <input type="time" class="usr-time" name="Duracion" value="00:00" id='Duracion'  readonly><br>
<br />
<div>
    <label>Informacion de la cita</label><br>
    Servicio: <input type="text" name="descripcionTarea" id="nombre" placeholder="Primero seleccione un servicio">
    Hora de Salida: <input type="time" class="usr-time" value="00:00" id="duracion" name="horaFinal">
    Costo Aproximado: <input type="text" name="costo" id="costo">
    
</div>
 <!-- <textarea id="txt" class="form-control" placeholder="Escribe aqui tu recordatorio..." rows="3" name="descripcionTarea" required></textarea>
-->
<br>
<div class="alert alert-danger fade in" id="alerta" >
    <a href="#" class="close" data-dismiss="alert">&times;</a>
    <a id="msg"><strong>Error!</strong> La hora de 'Inicio' o la hora de 'Salida' se encuentran fuera del horario de atencion.</a>
</div>
<div class="alert alert-success fade in" id="success" >
    <a href="#" class="close" data-dismiss="alert">&times;</a>
    <a id="msg"><strong>Success!</strong> La informacion ingresada es correcta precione el Boton <strong>'Apartar Cita'</strong> para hacer valida su reservacion.</a>
</div>
<center><input type="submit" value="Apartar Cita" class="btn btn-success" /></center>
</form><br />
<br><label for="comment">Nota: recuerde llegar unos minutos antes de la hora de su cita</label>
<a href="indexUsuarios.jsp" data-toggle="tooltip" title="IR A INICIO!" > Ir A Inicio</a></center>
</body>
</html>
