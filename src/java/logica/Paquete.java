package logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class Paquete implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int codigoPaquete;
    @Basic
    private double costoPaquete;
    @ManyToMany
    private List<Servicio> listaServicio;

    //Constructores
    public Paquete() {
    }

    public Paquete(int codigoPaquete, double costoPaquete, List<Servicio> listaServicio) {
        this.codigoPaquete = codigoPaquete;
        this.costoPaquete = costoPaquete;
        this.listaServicio = listaServicio;
    }

    //Getter & Setter
    public int getCodigoPaquete() {
        return codigoPaquete;
    }

    public void setCodigoPaquete(int codigoPaquete) {
        this.codigoPaquete = codigoPaquete;
    }

    public double getCostoPaquete() {
        return costoPaquete;
    }

    public void setCostoPaquete(double costoPaquete) {
        this.costoPaquete = costoPaquete;
    }

    public List<Servicio> getListaServicio() {
        return listaServicio;
    }

    public void setListaServicio(List<Servicio> listaServicio) {
        this.listaServicio = listaServicio;
    }
}
