<%-- 
    Document   : registrar
    Created on : 28-nov-2017, 21:47:36
    Author     : YILMER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="objetos.Usuario"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body <%=request.getParameter("onload")%>>
        
  
  <div class="container">
      <h2>Registre su Informacion</h2>
  <form action="registrarusuario.do" method="POST">
      <label >id </label><input type="number" class="form-control" name="idUsuario">
       <label>Nombres </label><input type="text" class="form-control"  name="nombresUsuario">
       <label>Apellidos </label><input type="text" class="form-control"  name="apellidosUsuario">
       <a id='resultado'>none</a>
      <label >Email:</label><input type="text" class="form-control"  name="direccionUsuario" id="email" placeholder="example@gmail.com" onkeyup="validarEmail(this)">
      <label>Telefono:</label><input type="text" class="form-control"  name="telefonoUsuario">
      <label>User name:</label><input type="text" class="form-control"  name="loginUsuario">
      <label>Password </label><input type="password" class="form-control" name="passwordUsuario">
    
    
    <br /><input type="submit" value="RegistrarUsuario" class="btn btn-success" /><a href="index.jsp" class="btn btn-danger">Salir!</a>
    
  </form>
  
   </div>
       
    </body>
    <script>
        
        
    function validarEmail(){
var email = document.getElementById("email");
       email.addEventListener("keyup", function (event) {
  if (email.validity.typeMismatch) {
    email.setCustomValidity("¡Yo esperaba una dirección de correo, cariño!");
  } else {
    email.setCustomValidity("");
  }
}); 

}
</script>
</html>
