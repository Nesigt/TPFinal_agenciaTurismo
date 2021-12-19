
package logica;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Usuario implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idUsu;
    @Basic
    private String nombreUsu;
    private String contraseniaUsu;

    //Constructores
    public Usuario() {
    }

    public Usuario(int idUsu, String nombreUsu, String contraseniaUsu) {
        this.idUsu = idUsu;
        this.nombreUsu = nombreUsu;
        this.contraseniaUsu = contraseniaUsu;
    }

    //Getter & Setter
    public int getIdUsu() {
        return idUsu;
    }

    public void setIdUsu(int idUsu) {
        this.idUsu = idUsu;
    }

    public String getNombreUsu() {
        return nombreUsu;
    }

    public void setNombreUsu(String nombreUsu) {
        this.nombreUsu = nombreUsu;
    }

    public String getContraseniaUsu() {
        return contraseniaUsu;
    }

    public void setContraseniaUsu(String contraseniaUsu) {
        this.contraseniaUsu = contraseniaUsu;
    }
    
    
}
