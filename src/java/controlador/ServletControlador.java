package controlador;
import javax.swing.*;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import objetos.Tarea;
import objetos.Trabajador;
import objetos.Usuario;
import objetos.Grupo;
import objetos.Servicios;
import objetos.Cifrar;
import java.util.Date;

public class ServletControlador extends HttpServlet {
private Connection conexion;

public void init(ServletConfig config) throws ServletException {
try {
     
   Class.forName(config.getInitParameter("driverBaseDatos"));
   conexion = DriverManager.getConnection(config.getInitParameter("urlBaseDatos"),config.getInitParameter("usuario"),config.getInitParameter("password"));
}
catch (SQLException ex) {
System.err.println(ex);
}
catch (ClassNotFoundException ex) {
System.err.println(ex);
}
}

/**
* Processes requests for both HTTP <code>GET</code> and <code>POST</code>
methods.
* @param request servlet request
* @param response servlet response

*/
protected void processRequest(HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException {
response.setContentType("text/html;charset=UTF-8");
String acción =request.getRequestURL().substring(request.getRequestURL().lastIndexOf("/") + 1);
System.out.println("accion recibida "+acción);
if (acción.equals("registrarusuario.do"))
registrarUsuario(request, response);
if (request.getSession().getAttribute("usuario") != null) {
if (acción.equals("autenticar.do"))
autenticar(request, response);
else if (acción.equals("listarservicios.do"))
listarServicios(request,response);
else if (acción.equals("agregarservicio.do"))
agregarservicio(request,response);
else if (acción.equals("registrartrabajador.do"))
registrarTrabajador2(request, response); 
else if (acción.equals("mostrarformulariotarea.do"))
mostrarRegistarTarea(request, response);
else if (acción.equals("registrartarea.do"))
registrarTarea(request, response);
else if (acción.equals("buscartarea.do"))
mostrarTareas3(request, response);
else if (acción.equals("mostrartareas.do"))
mostrarTareas(request, response);
else if (acción.equals("todastareas2.do"))
 todasTareas2(request, response);
else if (acción.equals("borrarregistros.do"))
 borrarRegistros(request, response);
else if (acción.equals("borrarregistrofecha.do"))
 borrarRegistroFecha(request, response);
else if (acción.equals("buscartarea.do"))
 buscarTarea(request, response);
else if (acción.equals("miscitas.do"))
 misCitas(request, response);
else if(acción.equals("mostrarcitashoy.do"))
    mostrarcitashoy(request,response);
else if(acción.equals("borrarregistrosantiguos.do"))
 borrarRegistrosAntiguos(request, response);
else if(acción.equals("servicios.do"))
    servicios(request,response);
else if (acción.equals("salir.do"))
salir(request, response);
}
else
autenticar(request, response);
}
// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
/**
* Handles the HTTP <code>GET</code> method.
* @param request servlet request
* @param response servlet response
*/


protected void doGet(HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException {
processRequest(request, response);
}
/**
* Handles the HTTP <code>POST</code> method.
* @param request servlet request
* @param response servlet response
*/
protected void doPost(HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException {
processRequest(request, response);


}
/**
* Returns a short description of the servlet.
*/
public String getServletInfo() {
return "Esto es una agenda en la Web";
}// </editor-fold>

private void registrarTarea(HttpServletRequest request,HttpServletResponse response) {
try {
 
Tarea tarea = new Tarea(((Usuario)request.getSession().getAttribute("usuario")).getIdUsuario(),
request.getParameter("descripcionTarea"), request.getParameter("fechaTarea"),
request.getParameter("horaTarea"),request.getParameter("horaFinal"));
String sql = String.format("insert into Tarea2 (idUsuarioTarea,descripcionTarea, fechaTarea, horaTarea,horaFinal)" + "values (%s, '%s', '%s', '%s','%s')",tarea.getIdUsuarioTarea(), tarea.getDescripcionTarea(), tarea.getFechaTarea(),tarea.getHoraTarea(),tarea.getHoraFinal());
Statement instrucción = conexion.createStatement();
int nroTuplas = instrucción.executeUpdate(sql);

if (nroTuplas > 0)
response.sendRedirect("indexUsuarios.jsp");
else
response.sendRedirect(String.format("agregartarea.jsp?onload=%s","onload=\"alert('No se ingreso la tarea correctamente')\""));
} catch (IOException ex) {
System.err.println(ex);
} catch (SQLException ex) {
System.err.println(ex);
}

}
private void agregarservicio(HttpServletRequest request,HttpServletResponse response) {
try {
 
Servicios serv = new Servicios(request.getParameter("idServicio"),
request.getParameter("nombreServicio"), request.getParameter("duracion"),
request.getParameter("costo"),request.getParameter("profesionAsociada"));
String sql = String.format("insert into servicio (idServicio,nombreServicio, duracion, costo,profesionAsociada)" + "values (%s, '%s', '%s', '%s','%s')",serv.getIdServicio(), serv.getNombreServicio(), serv.getDuracion(),serv.getCosto(),serv.getProfesionAsociada());
Statement instrucción = conexion.createStatement();
int nroTuplas = instrucción.executeUpdate(sql);

if (nroTuplas > 0)
    
response.sendRedirect("OpcionesAvanzadas.jsp");
else 
response.sendRedirect(String.format("OpcionesAvanzadas.jsp?onload=%s","onload=\"alert('ERROR: No se ingreso el servicio correctamente')\""));
} catch (IOException ex) {
System.err.println(ex);
} catch (SQLException ex) {
System.err.println(ex);
}

}
 
private void listarServicios(HttpServletRequest request,HttpServletResponse response) {
try {
String sql = String.format("Select * from servicio");
String sql2 = String.format("Select * from trabajador");
Statement instrucción = conexion.createStatement();
ResultSet resultado = instrucción.executeQuery(sql);
ArrayList<Servicios> serv = new ArrayList<Servicios>();

while (resultado.next())
serv.add(new Servicios(resultado.getString("idServicio"),
resultado.getString("nombreServicio"),
resultado.getString("duracion"),
resultado.getString("costo"),
resultado.getString("profesionAsociada")));
request.getSession().setAttribute("servicios", serv);

Statement instrucción2 = conexion.createStatement();
ResultSet resultado2 = instrucción.executeQuery(sql2);
ArrayList<Trabajador> trab = new ArrayList<Trabajador>();
//request.getSession().setAttribute("names", "luisa");
while (resultado2.next())
trab.add(new Trabajador(resultado2.getString("idTrabajador"),
resultado2.getString("nombresTrabajador"),
resultado2.getString("apellidosTrabajador"),
resultado2.getString("direccionTrabajador"),
resultado2.getString("telefonoTrabajador"),
resultado2.getString("profesion"),
resultado2.getString("loginTrabajador"),
        resultado2.getString("passwordTrabajador"),
        resultado2.getString("nivelAcceso")));
request.getSession().setAttribute("trabajadores", trab);
//request.getSession().setAttribute("fecha",
//request.getParameter("fechaTarea"));

response.sendRedirect("agregartarea.jsp");
} catch (IOException ex) {
System.err.println(ex);
} catch (SQLException ex) {
System.err.println(ex);
}
}

private static final char[] CONSTS_HEX = { '0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f' };
public static String encriptaMD5(String stringAEncriptar)
    {
        try
        {
           MessageDigest msgd = MessageDigest.getInstance("MD5");
           byte[] bytes = msgd.digest(stringAEncriptar.getBytes());
           StringBuilder strbCadenaMD5 = new StringBuilder(2 * bytes.length);
           for (int i = 0; i < bytes.length; i++)
           {
               int bajo = (int)(bytes[i] & 0x0f);
               int alto = (int)((bytes[i] & 0xf0) >> 4);
               strbCadenaMD5.append(CONSTS_HEX[alto]);
               strbCadenaMD5.append(CONSTS_HEX[bajo]);
           }
           return strbCadenaMD5.toString();
        } catch (NoSuchAlgorithmException e) {
           return null;
        }
    }
private void registrarTrabajador2(HttpServletRequest request,HttpServletResponse response) {
try {
   
    String pass=encriptaMD5(request.getParameter("passwordTrabajador"));
Trabajador registrar4 = new Trabajador(request.getParameter("idTrabajador"),request.getParameter("nombresTrabajador"), request.getParameter("apellidosTrabajador"),request.getParameter("direccionTrabajador"),
request.getParameter("telefonoTrabajador"),request.getParameter("profesion"),request.getParameter("loginTrabajador"),request.getParameter("passwordTrabajador"),request.getParameter("nivelAcceso"));
String sql = String.format("insert into trabajador (idtrabajador,nombrestrabajador,apellidostrabajador,direcciontrabajador,telefonotrabajador,profesion,logintrabajador,passwordtrabajador,nivelacceso) VALUES ('"+registrar4.getIdTrabajador()+"','"+registrar4.getNombresTrabajador()+"','"+registrar4.getApellidosTrabajador()+"','"+registrar4.getDireccionTrabajador()+"','"+registrar4.getTelefonoTrabajador()+"','"+registrar4.getProfesion()+"','"+registrar4.getLoginTrabajador()+"','"+pass+"','"+registrar4.getNivelAcceso()+"')");
System.out.println("sql a ejecutar "+sql);
Statement instrucción = conexion.createStatement();
 instrucción.executeUpdate(sql);
 response.sendRedirect("principal.jsp");
int nroTuplas = instrucción.executeUpdate(sql);
if (nroTuplas > 0)
    response.sendRedirect("index.jsp");
else
response.sendRedirect(String.format("OpcionesAvanzadas.jsp?onload=%s","onload=\"alert('No se ingreso el usuario')\""));
} catch (IOException ex) {
System.err.println(ex);
} catch (SQLException ex) {
System.err.println(ex);
}

}

private void registrarUsuario(HttpServletRequest request,HttpServletResponse response) {
try {
   
    String pass=encriptaMD5(request.getParameter("passwordUsuario"));
Usuario registrar2 = new Usuario(request.getParameter("idUsuario"),
request.getParameter("nombresUsuario"), request.getParameter("apellidosUsuario"),request.getParameter("direccionUsuario"),
request.getParameter("telefonoUsuario"),request.getParameter("loginUsuario"),request.getParameter("passwordUsuario"));
String sql = String.format("insert into usuario (idusuario,nombresusuario,apellidosusuario,direccionusuario,telefonousuario,loginusuario,passwordusuario) VALUES ('"+registrar2.getIdUsuario()+"','"+registrar2.getNombresUsuario()+"','"+registrar2.getApellidosUsuario()+"','"+registrar2.getDireccionUsuario()+"','"+registrar2.getTelefonoUsuario()+"','"+registrar2.getLoginUsuario()+"','"+pass+"')");
System.out.println("sql a ejecutar "+sql);
Statement instrucción = conexion.createStatement();
 instrucción.executeUpdate(sql);
int nroTuplas = instrucción.executeUpdate(sql);


if (nroTuplas > 0)
    response.sendRedirect("index.jsp");
else
response.sendRedirect(String.format("registrar.jsp?onload=%s","onload=\"alert('No se ingreso el usuario')\""));
} catch (IOException ex) {
System.err.println(ex);
} catch (SQLException ex) {
System.err.println(ex);
}

}

private void mostrarTareas(HttpServletRequest request,HttpServletResponse response) {
try {
String sql = String.format(
"Select * from Tarea2 where fechaTarea = '%s'",
request.getParameter("fechaTarea"));

Statement instrucción = conexion.createStatement();
ResultSet resultado = instrucción.executeQuery(sql);
ArrayList<Tarea> tareas = new ArrayList<Tarea>();
while (resultado.next())
tareas.add(new Tarea(resultado.getString("idUsuarioTarea"),
resultado.getString("descripcionTarea"),
resultado.getString("fechaTarea"),
resultado.getString("horaTarea"),
resultado.getString("horaFinal")));


request.getSession().setAttribute("tareas", tareas);
request.getSession().setAttribute("fecha",
request.getParameter("fechaTarea"));
response.sendRedirect("MisCitas.jsp");
} catch (IOException ex) {
System.err.println(ex);
} catch (SQLException ex) {
System.err.println(ex);
}
}

private void mostrarTareas3(HttpServletRequest request,HttpServletResponse response) {
try {
//String sql = String.format(
//"Select idUsuarioTarea,descripcionTarea,fechaTarea,horaTarea from Tarea,Usuario where nombresusuario like '%s' and idUsuarioTarea = idUsuario",
  //     "%"+request.getParameter("usuarioname")+"%");
String sql2 = String.format(
"Select * from Tarea2,Usuario where nombresusuario like '%s' and idUsuarioTarea = idUsuario",request.getParameter("usuarioname"));

Statement instrucción = conexion.createStatement();
ResultSet resultado = instrucción.executeQuery(sql2);
ArrayList<Grupo> grupos = new ArrayList<Grupo>();
while (resultado.next())
grupos.add(new Grupo(resultado.getString("idUsuarioTarea"),
resultado.getString("descripcionTarea"),
resultado.getString("fechaTarea"),resultado.getString("horaTarea"),
resultado.getString("horaFinal"),
resultado.getString("idUsuario"),
resultado.getString("nombresUsuario"),resultado.getString("apellidosUsuario"),
resultado.getString("direccionUsuario"),resultado.getString("telefonoUsuario")
));

request.getSession().setAttribute("tareas", grupos);
request.getSession().setAttribute("fecha",
request.getParameter("fechaTarea"));
response.sendRedirect("tareas.jsp");
} catch (IOException ex) {
System.err.println(ex);
} catch (SQLException ex) {
System.err.println(ex);
}
}

private void mostrarcitashoy(HttpServletRequest request,HttpServletResponse response) {
try {
String sql = String.format("Select * from Tarea2 where fechatarea = '%s' ",request.getParameter("fechaTarea"));
//String sql2=String.format("Select nombresusuario from usuario,tarea where idUsuarioTarea = idUsuario");
Statement instrucción2 = conexion.createStatement();
//Statement instrucción3 = conexion.createStatement();
ResultSet resultado = instrucción2.executeQuery(sql);
//ResultSet resultado2 = instrucción3.executeQuery(sql2);
ArrayList<Tarea> tareas2 = new ArrayList<Tarea>();
while (resultado.next())
tareas2.add(new Tarea(resultado.getString("idUsuarioTarea"),
resultado.getString("descripcionTarea"),
resultado.getString("fechaTarea"),
resultado.getString("horaTarea"),
resultado.getString("horaFinal")));

request.getSession().setAttribute("tareas", tareas2);
request.getSession().setAttribute("fecha",
request.getParameter("fechaTarea"));
//request.getSession().setAttribute("nombresusuario",request.getParameter("nombresusuario"));
response.sendRedirect("tareas2.jsp");
} catch (IOException ex) {
System.err.println(ex);
} catch (SQLException ex) {
System.err.println(ex);
}
}

private void todasTareas2(HttpServletRequest request,HttpServletResponse response) {
try {
String sql = String.format("Select * from Tarea2 ORDER BY fechatarea,horatarea");
//String sql2=String.format("Select nombresusuario from usuario,tarea where idUsuarioTarea = idUsuario");
Statement instrucción2 = conexion.createStatement();
//Statement instrucción3 = conexion.createStatement();
ResultSet resultado = instrucción2.executeQuery(sql);
//ResultSet resultado2 = instrucción3.executeQuery(sql2);
ArrayList<Tarea> tareas2 = new ArrayList<Tarea>();
while (resultado.next())
tareas2.add(new Tarea(resultado.getString("idUsuarioTarea"),
resultado.getString("descripcionTarea"),
resultado.getString("fechaTarea"),
resultado.getString("horaTarea"),
resultado.getString("horaFinal")));

request.getSession().setAttribute("tareas", tareas2);
request.getSession().setAttribute("fecha",
request.getParameter("fechaTarea"));
//request.getSession().setAttribute("nombresusuario",request.getParameter("nombresusuario"));
response.sendRedirect("tareas2.jsp");
} catch (IOException ex) {
System.err.println(ex);
} catch (SQLException ex) {
System.err.println(ex);
}
}

private void borrarRegistros(HttpServletRequest request,HttpServletResponse response) {
    try {
    String sql=String.format("Delete From tarea2 Where idUsuarioTarea = %s",((Usuario)request.getSession().getAttribute("usuario")).getIdUsuario());
    Statement instrucción2 = conexion.createStatement();
ResultSet resultado = instrucción2.executeQuery(sql);
ArrayList<Tarea> tareas2 = new ArrayList<Tarea>();

while (resultado.next())
 tareas2.remove(new Tarea(resultado.getString("idUsuarioTarea"),
resultado.getString("descripcionTarea"),
resultado.getString("fechaTarea"),
resultado.getString("horaTarea"),
 resultado.getString("horaFinal")));
response.sendRedirect("tareas2.jsp");

} catch (IOException ex) {
System.err.println(ex);
} catch (SQLException ex) {
System.err.println(ex);
}
}

private void borrarRegistrosAntiguos (HttpServletRequest request,HttpServletResponse response) {
    try {
    String sql=String.format("DELETE FROM Tarea2 WHERE fechaTarea < '%s' ",request.getParameter("fechaActual"));
    Statement instrucción3 = conexion.createStatement();
ResultSet resultado = instrucción3.executeQuery(sql);
ArrayList<Tarea> tareas = new ArrayList<Tarea>();
while (resultado.next())
tareas.remove(new Tarea(resultado.getString("idUsuarioTarea"),
resultado.getString("descripcionTarea"),
resultado.getString("fechaTarea"),
resultado.getString("horaTarea"),
 resultado.getString("horaFinal")));

response.sendRedirect("Principal.jsp");

} catch (IOException ex) {
System.err.println(ex);
} catch (SQLException ex) {
System.err.println(ex);
}
}

private void borrarRegistroFecha (HttpServletRequest request,HttpServletResponse response) {
    try {
    String sql=String.format("Delete From tarea2 Where idUsuarioTarea = %s ",
    ((Usuario)request.getSession().getAttribute("usuario")).getIdUsuario());
    Statement instrucción3 = conexion.createStatement();
ResultSet resultado = instrucción3.executeQuery(sql);
ArrayList<Tarea> tareas = new ArrayList<Tarea>();

while (resultado.next())
 tareas.remove(new Tarea(resultado.getString("idUsuarioTarea"),
resultado.getString("descripcionTarea"),
resultado.getString("fechaTarea"),
resultado.getString("horaTarea"),
 resultado.getString("horaFinal")));
response.sendRedirect("tareas.jsp");

} catch (IOException ex) {
System.err.println(ex);
} catch (SQLException ex) {
System.err.println(ex);
}
}
//response.sendRedirect("inicio.jsp");


private void mostrarRegistarTarea(HttpServletRequest request,HttpServletResponse response) {
try {
response.sendRedirect("agregartarea.jsp");
} catch (IOException ex) {
System.err.println(ex);
}
}
private void autenticar(HttpServletRequest request,HttpServletResponse response) {
    
try {
    //String passMD5=encriptamd5(request.getParameter("passwordUsuario"));
String sql = String.format("select * from usuario where loginUsuario like '%s' and passwordUsuario like '%s'", request.getParameter("loginUsuario"),request.getParameter("passwordUsuario"));
Statement instrucción = conexion.createStatement();
ResultSet resultado = instrucción.executeQuery(sql);

if (resultado.next()) {
   Usuario usr = new Usuario(resultado.getString("idUsuario"),resultado.getString("nombresUsuario"), resultado.getString("apellidosUsuario"),resultado.getString("direccionUsuario"),resultado.getString("telefonoUsuario"), resultado.getString("loginUsuario"),resultado.getString("passwordUsuario"));
  
if(usr.getLoginUsuario().compareTo("admin")==0 && usr.getPasswordUsuario().compareTo("21232f297a57a5a743894a0e4a801fc3")==0)
{
 String sql2 = String.format("select * from tarea2 ORDER BY fechatarea asc");
Statement instrucción2 = conexion.createStatement();
ResultSet resultado2 = instrucción2.executeQuery(sql2);
ArrayList<Tarea> tareas = new ArrayList<Tarea>();
while (resultado2.next()){
tareas.add(new Tarea(resultado2.getString("idUsuarioTarea"),
resultado2.getString("descripcionTarea"),
resultado2.getString("fechaTarea"),
resultado2.getString("horaTarea"),
resultado2.getString("horaFinal"))
);
}
request.getSession().setAttribute("tareas", tareas);
response.sendRedirect("Principal.jsp");
request.getSession().setAttribute("usuario", usr);
}else{
    //System.out.println("id usuario "+resultado.getString("idUsuario"));
    Date fechaActual = new Date();
    String sql2 = String.format("select * from tarea2 where idusuariotarea = '%s' and fechatarea >= '%s'",resultado.getString("idUsuario"),fechaActual);
Statement instrucción2 = conexion.createStatement();
ResultSet resultado2 = instrucción2.executeQuery(sql2);
ArrayList<Tarea> tareas = new ArrayList<Tarea>();
while (resultado2.next())
tareas.add(new Tarea(resultado2.getString("idUsuarioTarea"),
resultado2.getString("descripcionTarea"),
resultado2.getString("fechaTarea"),
resultado2.getString("horaTarea"),
resultado2.getString("horaFinal")));

request.getSession().setAttribute("usuario", usr);
request.getSession().setAttribute("tareas", tareas);
response.sendRedirect("indexUsuarios.jsp");
}
} else {
response.sendRedirect(String.format("index.jsp"));
}
} catch (IOException ex) {
System.err.println(ex);
} catch (SQLException ex) {
System.err.println(ex);
}
}
private void misCitas(HttpServletRequest request,HttpServletResponse response) {
try {
String sql = String.format(
"Select * from Tarea2 where idUsuarioTarea = %s ",
((Usuario)request.getSession().getAttribute("usuario")).getIdUsuario());
Statement instrucción = conexion.createStatement();
ResultSet resultado = instrucción.executeQuery(sql);
ArrayList<Tarea> tareas = new ArrayList<Tarea>();
while (resultado.next())
tareas.add(new Tarea(resultado.getString("idUsuarioTarea"),
resultado.getString("descripcionTarea"),
resultado.getString("fechaTarea"),
resultado.getString("horaTarea"),
resultado.getString("horaFinal")));

request.getSession().setAttribute("tareas", tareas);
request.getSession().setAttribute("fecha",
request.getParameter("fechaTarea"));
response.sendRedirect("MisCitas.jsp");
} catch (IOException ex) {
System.err.println(ex);
} catch (SQLException ex) {
System.err.println(ex);
}
}



private void clasificarUsuario(HttpServletRequest request,HttpServletResponse response) {
try {
String sql = String.format("select * from usuario where loginUsuario like '%s' and passwordUsuario like '%s'", request.getParameter("loginUsuario"),request.getParameter("passwordUsuario"));
Statement instrucción = conexion.createStatement();
ResultSet resultado = instrucción.executeQuery(sql);
if (resultado.next()) {
   Usuario usr = new Usuario(resultado.getString("idUsuario"),resultado.getString("nombresUsuario"), resultado.getString("apellidosUsuario"),resultado.getString("direccionUsuario"),resultado.getString("telefonoUsuario"), resultado.getString("loginUsuario"),resultado.getString("passwordUsuario"));
  
if(usr.getLoginUsuario().compareTo("admin")==0 && usr.getPasswordUsuario().compareTo("21232f297a57a5a743894a0e4a801fc3")==0)
{
response.sendRedirect("inicio.jsp");
request.getSession().setAttribute("usuario", usr);
}else{
response.sendRedirect("indexUsuarios.jsp");
request.getSession().setAttribute("usuario", usr);}
} else {
response.sendRedirect(String.format("index.jsp"));
}
} catch (IOException ex) {
System.err.println(ex);
} catch (SQLException ex) {
System.err.println(ex);
}
}

private void servicios(HttpServletRequest request,HttpServletResponse response){
try {
String sql = String.format("Select * from servicio");
Statement instrucción = conexion.createStatement();
ResultSet resultado = instrucción.executeQuery(sql);
ArrayList<Servicios> serv = new ArrayList<Servicios>();
while (resultado.next())
serv.add(new Servicios(resultado.getString("idservicio"),
resultado.getString("nombreservicio"),
resultado.getString("duracion"),
resultado.getString("costo"),
resultado.getString("profesionasociada")
));

request.getSession().setAttribute("servicios", serv);
response.sendRedirect("Servicios.jsp");
} catch (IOException ex) {
System.err.println(ex);
} catch (SQLException ex) {
System.err.println(ex);
}
}

private void buscarTarea(HttpServletRequest request,HttpServletResponse response) {
try {
String sql = String.format(
"Select * from Tarea2 where idUsuarioTarea = %s and fechaTarea = '%s'",
((Usuario)request.getSession().getAttribute("usuario")).getIdUsuario(),
request.getParameter("fechaTarea"));

Statement instrucción = conexion.createStatement();
ResultSet resultado = instrucción.executeQuery(sql);
ArrayList<Tarea> tareas = new ArrayList<Tarea>();

while (resultado.next())
tareas.add(new Tarea(resultado.getString("idUsuarioTarea"),
resultado.getString("descripcionTarea"),
resultado.getString("fechaTarea"),
resultado.getString("horaTarea"),
resultado.getString("horaFinal")));

request.getSession().setAttribute("names", "luisa");
request.getSession().setAttribute("tareas", tareas);
request.getSession().setAttribute("fecha",
request.getParameter("fechaTarea"));

response.sendRedirect("tareas.jsp");
} catch (IOException ex) {
System.err.println(ex);
} catch (SQLException ex) {
System.err.println(ex);
}
}


private void salir(HttpServletRequest request,
HttpServletResponse response){ 
try {
   
request.getSession().removeAttribute("usuario");
response.sendRedirect(String.format("index.jsp"));
}
catch (IOException ex) {
System.err.println(ex);
}
}

}