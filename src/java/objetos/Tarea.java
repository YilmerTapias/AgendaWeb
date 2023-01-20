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
public class Tarea {
private String idUsuarioTarea;
private String descripcionTarea;
private String fechaTarea;
private String horaTarea;
private String horaFinal;

public Tarea() {

}

public Tarea(String idUsuarioTarea, String descripcionTarea,
String fechaTarea, String horaTarea,String horaFinal) {
setIdUsuarioTarea(idUsuarioTarea);
setDescripcionTarea(descripcionTarea);
setFechaTarea(fechaTarea);
setHoraTarea(horaTarea);
setHoraFinal(horaFinal);
}
public String getHoraFinal(){
return horaFinal;
}
public void setHoraFinal(String horaFinal){
this.horaFinal=horaFinal;
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
}
