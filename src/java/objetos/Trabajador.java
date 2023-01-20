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
public class Trabajador {
private String idTrabajador;
private String nombresTrabajador;
private String apellidosTrabajador;
private String direccionTrabajador;
private String telefonoTrabajador;
private String profesion;
private String loginTrabajador;
private String passwordTrabajador;
private String nivelAcceso;


public Trabajador() {

}
public Trabajador(String idTrabajador, String nombresTrabajador,
String apellidosTrabajador, String direccionTrabajador,
String telefonoTrabajador,String profesion, String loginTrabajador,
String passwordTrabajador,String nivelAcceso) {

setIdTrabajador(idTrabajador);
setNombresTrabajador(nombresTrabajador);
setApellidosTrabajador(apellidosTrabajador);
setDireccionTrabajador(direccionTrabajador);
setTelefonoTrabajador(telefonoTrabajador);
setProfesion(profesion);
setLoginTrabajador(loginTrabajador);
setPasswordTrabajador(passwordTrabajador);
setNivelAcceso(nivelAcceso);
}

    public String getIdTrabajador() {
        return idTrabajador;
    }

    public void setIdTrabajador(String idTrabajador) {
        this.idTrabajador = idTrabajador;
    }

    public String getNombresTrabajador() {
        return nombresTrabajador;
    }

    public void setNombresTrabajador(String nombresTrabajador) {
        this.nombresTrabajador = nombresTrabajador;
    }

    public String getApellidosTrabajador() {
        return apellidosTrabajador;
    }

    public void setApellidosTrabajador(String apellidosTrabajador) {
        this.apellidosTrabajador = apellidosTrabajador;
    }

    public String getDireccionTrabajador() {
        return direccionTrabajador;
    }

    public void setDireccionTrabajador(String direccionTrabajador) {
        this.direccionTrabajador = direccionTrabajador;
    }

    public String getTelefonoTrabajador() {
        return telefonoTrabajador;
    }

    public void setTelefonoTrabajador(String telefonoTrabajador) {
        this.telefonoTrabajador = telefonoTrabajador;
    }

    public String getProfesion() {
        return profesion;
    }

    public void setProfesion(String profesion) {
        this.profesion = profesion;
    }

    public String getLoginTrabajador() {
        return loginTrabajador;
    }

    public void setLoginTrabajador(String loginTrabajador) {
        this.loginTrabajador = loginTrabajador;
    }

    public String getPasswordTrabajador() {
        return passwordTrabajador;
    }

    public void setPasswordTrabajador(String passwordTrabajador) {
        this.passwordTrabajador = passwordTrabajador;
    }
    public String getNivelAcceso() {
        return nivelAcceso;
    }

    public void setNivelAcceso(String nivelAcceso) {
        this.nivelAcceso = nivelAcceso;
    }
}
