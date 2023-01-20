/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package objetos;

/**
 *
 * @author YILMER
 */
public class Usuario {
private String idUsuario;
private String nombresUsuario;
private String apellidosUsuario;
private String direccionUsuario;
private String telefonoUsuario;
private String loginUsuario;
private String passwordUsuario;

public Usuario() {

}

public Usuario(String idUsuario, String nombresUsuario,
String apellidosUsuario, String direccionUsuario,
String telefonoUsuario, String loginUsuario,
String passwordUsuario) {

setIdUsuario(idUsuario);
setNombresUsuario(nombresUsuario);
setApellidosUsuario(apellidosUsuario);
setDireccionUsuario(direccionUsuario);
setTelefonoUsuario(telefonoUsuario);
setLoginUsuario(loginUsuario);
setPasswordUsuario(passwordUsuario);
}

public String getIdUsuario() {
return idUsuario;
}
public void setIdUsuario(String idUsuario) {
this.idUsuario = idUsuario;
}
public String getNombresUsuario() {
return nombresUsuario;
}
public void setNombresUsuario(String nombresUsuario) {
this.nombresUsuario = nombresUsuario;
}
public String getApellidosUsuario() {
return apellidosUsuario;
}
public void setApellidosUsuario(String apellidosUsuario) {
this.apellidosUsuario = apellidosUsuario;
}
public String getDireccionUsuario() {
return direccionUsuario;

}
public void setDireccionUsuario(String direccionUsuario) {
this.direccionUsuario = direccionUsuario;
}
public String getTelefonoUsuario() {
return telefonoUsuario;
}
public void setTelefonoUsuario(String telefonoUsuario) {
this.telefonoUsuario = telefonoUsuario;
}
public String getLoginUsuario() {
return loginUsuario;
}
public void setLoginUsuario(String loginUsuario) {
this.loginUsuario = loginUsuario;
}
public String getPasswordUsuario() {
return passwordUsuario;
}
public void setPasswordUsuario(String passwordUsuario) {
this.passwordUsuario = passwordUsuario;
}

}
