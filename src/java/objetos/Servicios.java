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
public class Servicios {
    
private String idServicio;
private String nombreServicio;
private String duracion;
private String Costo;
private String profesionAsociada;

   

   
public Servicios() {

}

public Servicios(String idServicio, String nombreServicio,
String duracion, String costo,String profesionAsociada) {
setIdServicio(idServicio);
setNombreServicio(nombreServicio);
setDuracion(duracion);
setCosto(costo);
setProfesionAsociada(profesionAsociada);

}
 public String getProfesionAsociada() {
        return profesionAsociada;
    }

    public void setProfesionAsociada(String profesionAsociada) {
        this.profesionAsociada = profesionAsociada;
    }
 public String getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(String idServicio) {
        this.idServicio = idServicio;
    }

    public String getNombreServicio() {
        return nombreServicio;
    }

    public void setNombreServicio(String nombreServicio) {
        this.nombreServicio = nombreServicio;
    }

    public String getDuracion() {
        return duracion;
    }

    public void setDuracion(String duracion) {
        this.duracion = duracion;
    }

    public String getCosto() {
        return Costo;
    }

    public void setCosto(String Costo) {
        this.Costo = Costo;
    }
}
