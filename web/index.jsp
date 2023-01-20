<%-- 
    Document   : index
    Created on : 23-nov-2017, 0:28:29
    Author     : YILMER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="objetos.Cifrar"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN</title>
        <link rel="stylesheet" href="estilo.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="MD5.js"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script type="text/javascript" src="MD5.js"></script>
        <style>
            body { background-color: #e2e6ea;}
            
         </style>
</head>
<body <%=request.getParameter("onload")%>>

<form action="autenticar.do" method="POST">
    <center>   
    <div class="imgcontainer">
    <img src="imagenes/icons8-tienda.png" alt="Avatar" class="avatar">
    
    </div>

    <div class="container">
    <label><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="loginUsuario" class="user"  size=15 required>
    <br>
      <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="passwordUsuario2" onkeyup="this.form.passwordUsuario.value = MD5(this.form.passwordUsuario2.value)" class="pass" size=8  required >
    <br /><input type="text" name="passwordUsuario" class="pass" size=15 style="visibility:hidden">
    
    <br /><input type="checkbox" checked="checked"> Remember me<br />
    <button type="submit" class="login" value="Entrar">LOGIN</button>
    </div>
   </center>
    <div class="container" style="background-color:#f1f1f1">
    <button type="button" class="cancelbtn" >Cancel</button>
    <span class="psw">Eres nuevo <a href="registrar.jsp">Registrate?</a></span>
    </div>
         
</form>

    
</body>
</html>