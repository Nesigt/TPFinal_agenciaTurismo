package logica;

import java.sql.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-12-17T15:52:54")
@StaticMetamodel(Servicio.class)
public class Servicio_ { 

    public static volatile SingularAttribute<Servicio, String> descripcion;
    public static volatile SingularAttribute<Servicio, Integer> codigoServicio;
    public static volatile SingularAttribute<Servicio, String> destinoServicio;
    public static volatile SingularAttribute<Servicio, Double> costoServicio;
    public static volatile SingularAttribute<Servicio, Date> fechaServicio;
    public static volatile SingularAttribute<Servicio, String> nombre;

}