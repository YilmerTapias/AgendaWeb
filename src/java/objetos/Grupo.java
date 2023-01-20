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
public class Grupo {
 private String idUsuarioTarea;
private String descripcionTarea;
private String fechaTarea;
private String horaTarea;
private String horaFinal;

private String idUsuario;
private String nombresUsuario;
private String apellidosUsuario;
private String direccionUsuario;
private String telefonoUsuario;

public Grupo(){

}
public Grupo(String idUsuarioTarea, String descripcionTarea,String fechaTarea, String horaTarea,String horaFinal,String idUsuario, String nombresUsuario,
String apellidosUsuario, String direccionUsuario,String telefonoUsuario) {
setIdUsuarioTarea(idUsuarioTarea);
setDescripcionTarea(descripcionTarea);
setFechaTarea(fechaTarea);
setHoraTarea(horaTarea);
setHoraFinal(horaFinal);
setIdUsuario(idUsuario);
setNombresUsuario(nombresUsuario);
setApellidosUsuario(apellidosUsuario);
setDireccionUsuario(direccionUsuario);
setTelefonoUsuario(telefonoUsuario);
}


public String getIdUsuarioTarea() {
return idUsuarioTarea;
}
public void setIdUsuarioTarea(String idUsuarioTarea) {
this.idUsuarioTarea = idUsuarioTarea;
}
public String getDescripcionTarea() {
return descripcionTarea;
}

public void setDescripcionTarea(String descripcionTarea) {
this.descripcionTarea = descripcionTarea;
}
public String getFechaTarea() {
return fechaTarea;
}
public void setFechaTarea(String fechaTarea) {
this.fechaTarea = fechaTarea;
}
public String getHoraTarea() {
return horaTarea;
}
public void setHoraTarea(String horaTarea) {
this.horaTarea = horaTarea;
}
public String getHoraFinal(){
return horaFinal;
}
public void setHoraFinal(String horaFinal){
this.horaFinal=horaFinal;
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
}
