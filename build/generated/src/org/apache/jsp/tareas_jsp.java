package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import objetos.Tarea;
import objetos.Usuario;
import objetos.Grupo;

public final class tareas_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("\"http://www.w3.org/TR/html4/loose.dtd\">\n");


if (request.getSession().getAttribute("usuario") == null)
response.sendRedirect("index.jsp");


      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("        <script type=\"text/javascript\" src=\"js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\n");
      out.write("        <style>\n");
      out.write("            body {background-color: #e2e6ea;}\n");
      out.write("         </style>\n");
      out.write("        \n");
      out.write("<title>BarberiaOnline</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <script>\n");
      out.write("      function mifuncion() {\n");
      out.write("         \n");
      out.write("        var home = \"");
      out.print(((Usuario)request.getSession().getAttribute("usuario")).getLoginUsuario());
      out.write("\";\n");
      out.write("        var hola = String(home);\n");
      out.write("        console.log(hola);\n");
      out.write("        if(home==\"admin\"){\n");
      out.write("            //document.getElementById('home').href = \"inicio.jsp\";\n");
      out.write("             location.href=\"inicio.jsp\";\n");
      out.write("            console.log(\"entro\");\n");
      out.write("        }else\n");
      out.write("        {\n");
      out.write("            location.href=\"indexUsuarios.jsp\";\n");
      out.write("        }}\n");
      out.write("    </script> \n");
      out.write("     <div class=\"wrapper\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("        \t<div class=\"row\">\n");
      out.write("                <div class=\"col-md-12\">\n");
      out.write("                <header id=\"header\">\n");
      out.write("\n");
      out.write("       <div class=\"slider\">\n");
      out.write("               <nav class=\"navbar navbar-default\">\n");
      out.write("                        <!-- Brand and toggle get grouped for better mobile display -->\n");
      out.write("                        <div class=\"navbar-header\">\n");
      out.write("\n");
      out.write("                          <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#mainNav\">\n");
      out.write("                            <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("                            <span class=\"icon-bar\"></span>\n");
      out.write("                            <span class=\"icon-bar\"></span>\n");
      out.write("                            <span class=\"icon-bar\"></span>\n");
      out.write("                          </button>\n");
      out.write("                          \n");
      out.write("                         <a class=\"jaja\" href=\"#\"><img class=\"avatar\" src=\"imagenes/icons8-admin-96.png\"></a>\n");
      out.write("                         <!-- <a class=\"navbar-brand\" href=\"#\"><img class=\"img-responsive\" src=\"http://rolyart.ro/wp-content/uploads/2016/07/roland-maruntelu-freelancer-romania.jpg\"></a>-->\n");
      out.write("                          <span class=\"site-name\"><b>");
      out.print(((Usuario)request.getSession().getAttribute("usuario")).getNombresUsuario());
      out.write("   ");
      out.print(((Usuario)request.getSession().getAttribute("usuario")).getApellidosUsuario());
      out.write("</b></span>\n");
      out.write("                          <span class=\"site-description\">Bienvenido a su agenda en la WEB</span>\n");
      out.write("                        </div>\n");
      out.write("                        </div>\n");
      out.write("                           <div class=\"panel panel-primary\">\n");
      out.write("                      <div class=\"collapse navbar-collapse\" id=\"mainNav\" >\n");
      out.write("               <ul class=\"nav main-menu navbar-nav\">\n");
      out.write("                <li ><a id=\"home\" onclick=\"mifuncion()\"><i class=\"fa fa-home\"></i> HOME</a></li>\n");
      out.write("                <li><a href=\"agregartarea.jsp\" >Agregar a agenda</a></li>\n");
      out.write("                <li><a href=\"tareas2.jsp\">Toda mi agenda</a></li>\n");
      out.write("                <li><a href=\"index.jsp\" >Salir</a></li>\n");
      out.write("                 </ul>\n");
      out.write("                   </div>\n");
      out.write("               </div>\n");
      out.write("           <div class=\"panel-body\"></div>\n");
      out.write("      </div>   \n");
      out.write("             \n");
      out.write(" ");

 String username = (String)request.getAttribute("names");


      out.write("   \n");
      out.write("\n");

ArrayList<Grupo> grupos =(ArrayList)request.getSession().getAttribute("tareas");
if (grupos.size() > 0) {

      out.write("\n");
      out.write("<center><h2><font face=\"Comic Sans MS,arial,verdana\">Informacion sobre: ");
      out.print(grupos.get(1).getNombresUsuario()+" "+ grupos.get(1).getApellidosUsuario());
      out.write(" </font></h2></center>\n");
      out.write("  <form action=\"borrarregistrofecha.do\" method=\"post\"><br />\n");
      out.write("    <input value=\"Borrar todo\" type=\"submit\" class=\"btn btn-danger\" />\n");
      out.write("    </form><br />\n");
      out.write("<div class=\"table-sresponsive\">\n");
      out.write("<table border=\"1\" class=\"table\" color=\"#ffff\">\n");
      out.write("    <thead class=\"thead-inverse\">  \n");
      out.write("<tr>\n");
      out.write("<th bgcolor=\"#16A085\">Nombre</th>    \n");
      out.write("<th bgcolor=\"#16A085\">Descripcion</th>\n");
      out.write("<th bgcolor=\"#16A085\">Fecha</th>\n");
      out.write("<th bgcolor=\"#16A085\">Hora-Inicio</th>\n");
      out.write("<th bgcolor=\"#16A085\">Hora-Fin</th>\n");
      out.write("</tr>\n");
      out.write("</thead> \n");
      out.write("</div>\n");

for (Grupo t : grupos) {

      out.write("\n");
      out.write("<tr>\n");
      out.write("<td>");
      out.print(t.getNombresUsuario() );
      out.write("</td>\n");
      out.write("<td>");
      out.print(t.getDescripcionTarea());
      out.write("</td>\n");
      out.write("<td>");
      out.print(t.getFechaTarea());
      out.write("</td>\n");
      out.write("<td>");
      out.print(t.getHoraTarea());
      out.write("</td>\n");
      out.write("<td>");
      out.print(t.getHoraFinal());
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("\n");

}

request.removeAttribute("fecha");
request.removeAttribute("tareas");

      out.write("\n");
      out.write("\n");
      out.write("</table></div>\n");

}
else {

      out.write("\n");
      out.write("<h3>No hay tareas programadas</h3>\n");

}

      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
