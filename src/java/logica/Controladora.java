
package logica;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import persistencia.ControladoraPersistencia;

public class Controladora {
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    //<editor-fold desc="Acciones a realizar Clase Empleado y Clase Usuario">
    //<editor-fold desc="Clase Empleado">
    public void crearEmpleado(String nombre, String apellido, String direccion, int dni, Date fechaNac, String nacionalidad, String celular, String email, String cargo, double sueldo, String nombreUsu, String contraseniaUsu) {
        Empleado empleado = new Empleado();
        Usuario usuario = new Usuario();
        
        //Asigno valores del usuario
        usuario.setNombreUsu(nombreUsu);
        usuario.setContraseniaUsu(contraseniaUsu);
        
        //Asigno valores del empleado
        empleado.setNombre(nombre);
        empleado.setApellido(apellido);
        empleado.setDireccion(direccion);
        empleado.setDni(dni);
        empleado.setFechaNac(fechaNac);
        empleado.setNacionalidad(nacionalidad);
        empleado.setCelular(celular);
        empleado.setEmail(email);
        empleado.setCargo(cargo);
        empleado.setSueldo(sueldo);
        empleado.setUsuario(usuario); //Asigno variable usuario que tiene sus datos ya cargados.
        
        controlPersis.crearEmpleado(empleado, usuario);
    }
    
    public List<Empleado> listarEmpleado(){
        return controlPersis.listarEmpleado();
    }
    
    public Empleado buscarEmpleado(int id){
        return controlPersis.buscarEmpleado(id);
    }
    public void eliminarEmpleado(int id) {
        controlPersis.eliminarEmpleado(id);
    }

    public void modificarEmpleado(Empleado empleado) {
        controlPersis.modificarEmpleado(empleado);
    }

    public boolean empleadoDniExiste(int dni){
        List<Empleado> listarEmpleado = controlPersis.listarEmpleado();
        for(Empleado empleado : listarEmpleado){
            if(empleado.getDni() == dni){
                return true;
            }
        }
        return false;
    }
    public boolean buscarUsuarioEmpleado(String nombreUsu) {
        Empleado empleado = new Empleado();
        List<Empleado> listarEmpleado = listarEmpleado();
        for(Empleado emple : listarEmpleado){
            if(emple.getUsuario().getNombreUsu().equals(nombreUsu)){
                empleado = emple;
                return true;
            }
        }
        System.out.println(empleado.getUsuario());
        return false;
    }
    
    public Empleado buscarUsuarioEmpleadoEmpleado(String nombreUsu) {
        Empleado empleado = new Empleado();
        List<Empleado> listarEmpleado = listarEmpleado();
        for(Empleado emple : listarEmpleado){
            if(emple.getUsuario().getNombreUsu().equals(nombreUsu)){
                empleado = emple;
                return empleado;
            }
        }
        System.out.println(empleado.getUsuario());
        return empleado;
    }
    //</editor-fold> (EMPLEADO)
    
    //<editor-fold desc="Clase Usuario">
    public boolean verificarUsuario(String nombreUsu, String contraseniaUsu) {
        List<Usuario> listaUsuario = controlPersis.listarUsuario();
        if(listaUsuario != null){
            for(Usuario usuario : listaUsuario){
                if(usuario.getNombreUsu().equals(nombreUsu)){ 
                    if(usuario.getContraseniaUsu().equals(contraseniaUsu)){
                    return true;
                }}
            }
        }
        return nombreUsu.equals("admin") && contraseniaUsu.equals("admin");
    }
    
    public List<Usuario> listarUsuario(){
        return controlPersis.listarUsuario();
    }
    
    public void eliminarUsuario(int idUsuario) {
        controlPersis.eliminarUsuario(idUsuario);
    }

    public void modificarUsuario(Usuario usuario) {
        controlPersis.modificarUsuario(usuario);
    }
    //</editor-fold> (USUARIO)
    public boolean empleadoExisteVenta(int id) {
        List<Venta> listarVenta = listarVenta();
        for(Venta venta : listarVenta){
            if(venta.getEmpleado()!= null){
                if(venta.getEmpleado().getIdEmpleado() == id){
                    return true;
                }
            }
        }
        return false;
    }
    //</editor-fold> (Clase Empleado y Clase Usuario)
    
    //<editor-fold desc="Acciones a realizar Clase Cliente">

    public void crearCliente(String nombre, String apellido, String direccion, int dni, Date fechaNac, String nacionalidad, String celular, String email) {
        Cliente cliente = new Cliente();
        
        //Asigno valores del cliente
        cliente.setNombre(nombre);
        cliente.setApellido(apellido);
        cliente.setDireccion(direccion);
        cliente.setDni(dni);
        cliente.setFechaNac(fechaNac);
        cliente.setNacionalidad(nacionalidad);
        cliente.setCelular(celular);
        cliente.setEmail(email);
        
        controlPersis.crearCliente(cliente);
    }
    
    public List<Cliente> listarCliente(){
        return controlPersis.listarCliente();
    }

    public Cliente buscarCliente(int id) {
        return controlPersis.buscarCliente(id);
    }

    public boolean clienteDniExiste(int dni){
        List<Cliente> listarCliente = controlPersis.listarCliente();
        for(Cliente cliente : listarCliente){
            if(cliente.getDni() == dni){
                return true;
            }
        }
        return false;
    }
    
    public void eliminarCliente(int id) {
        controlPersis.eliminarCliente(id);
    }
    
    public void modificarCliente(Cliente cliente) {
        controlPersis.modificarCliente(cliente);
    }
    
    public boolean clienteExisteVenta(int id) {
        List<Venta> listarVenta = listarVenta();
        for(Venta venta : listarVenta){
            if(venta.getCliente()!= null){
                if(venta.getCliente().getIdCliente() == id){
                    return true;
                }
            }
        }
        return false;
    }
    //</editor-fold> (Clase Cliente)
    
    //<editor-fold desc="Acciones a realizar Clase Servicio">
    public void crearServicio(String nombre, String descripcion, String destinoServicio, Date fechaServicio, double costoServicio) {
        Servicio servicio = new Servicio();
        //Asigno valores del servicio
        servicio.setNombre(nombre);
        servicio.setDescripcion(descripcion);
        servicio.setDestinoServicio(destinoServicio);
        servicio.setFechaServicio(fechaServicio);
        servicio.setCostoServicio(costoServicio);
        
        controlPersis.crearServicio(servicio);
    }
    
    public List<Servicio> listarServicio(){
        return controlPersis.listarServicio();
    }
    
    public Servicio buscarServicio(int id) {
        return controlPersis.buscarServicio(id);
    }

    public void eliminarServicio(int id) {
        controlPersis.eliminarServicio(id);
    }
    
    public void modificarServicio(Servicio servicio) {
        controlPersis.modificarServicio(servicio);
    }
    
    public boolean servicioExisteVenta(int id) {
        List<Venta> listarVenta = listarVenta();
        for(Venta venta : listarVenta){
            if(venta.getServicio() != null){
                if(venta.getServicio().getCodigoServicio()== id){
                    return true;
                }
            }
        }
        return false;
    }
    public boolean clienteExistePaquete(int id) {
        List<Paquete> listarPaquete = listarPaquete();
        for(Paquete paquete : listarPaquete){
            List<Servicio> listaServicios = paquete.getListaServicio();
            if(listaServicios != null){
                for (Servicio servicio : listaServicios) {
                    if(servicio.getCodigoServicio() == id){
                        return true;
                    }
                }
            }
        }
        return false;
    }
    //</editor-fold> (Clase Servicio)
    
    //<editor-fold desc="Acciones a realizar Clase Paquete">
    public void crearPaquete(String[] listaServicios) {
        Paquete paquete = new Paquete();
        
        //Asigno valores del paquete
        double costoPaquete = 0;
        Servicio servicio = new Servicio();
        List<Servicio> servicios = new ArrayList<>();
        for (String lista : listaServicios) {
            servicio = buscarServicio(Integer.parseInt(lista));
            costoPaquete += servicio.getCostoServicio();
            servicios.add(servicio);
        }
        paquete.setCostoPaquete(costoPaquete);
        paquete.setListaServicio(servicios);
        
        controlPersis.crearPaquete(paquete);
    }
    
    public List<Paquete> listarPaquete(){
        return controlPersis.listarPaquete();
    }
    
    public Paquete buscarPaquete(int id) {
        return controlPersis.buscarPaquete(id);
    }
    
    public void eliminarPaquete(int id) {
        controlPersis.eliminarPaquete(id);
    }
    
    public void modificarPaquete(Paquete paquete) {
        controlPersis.modificarPaquete(paquete);
    }
    
    public boolean paqueteExisteVenta(int id) {
        List<Venta> listarVenta = listarVenta();
        for(Venta venta : listarVenta){
            if(venta.getPaquete()!= null){
                if(venta.getPaquete().getCodigoPaquete()== id){
                    return true;
                }
            }
        }
        return false;
    }
    //</editor-fold> (Clase Paquete)

    //<editor-fold desc="Acciones a realizar Clase Venta">
    public void crearVenta(Date fechaVenta, String medioPago, int codigoPaquete, int codigoServicio, int dniCliente, String nombreUsu, String contraseniaUsu) {
        Venta venta = new Venta();
        //Asigno valores correspondientes necesarios para crear la venta
        Paquete paquete = buscarPaquete(codigoPaquete);
        Servicio servicio = buscarServicio(codigoServicio);
        List<Cliente> listarCliente = listarCliente();
        Cliente cliente = new Cliente();
        for(Cliente c : listarCliente){
            if(c.getDni() == dniCliente){
                cliente = c;
            }
        }
        Empleado empleado = new Empleado();
        List<Empleado> listarEmpleado = listarEmpleado();
        for(Empleado emple : listarEmpleado){
            if(emple.getUsuario().getNombreUsu().equals(nombreUsu)){
                empleado = emple;
                break;
            }
        }
        //Asigno valores de la venta
        venta.setFechaVenta(fechaVenta);
        venta.setMedioPago(medioPago);
        venta.setPaquete(paquete);
        venta.setServicio(servicio);
        venta.setCliente(cliente);
        venta.setEmpleado(empleado);
        //Creo la venta
        controlPersis.crearVenta(venta);
    }

    public List<Venta> listarVenta() {
        return controlPersis.listarVenta();
    }
    public void eliminarVenta(int id) {
        controlPersis.eliminarVenta(id);
    }

    public Venta buscarVenta(int id) {
        return controlPersis.buscarVenta(id);
    }

    public void modificarVenta(Venta venta) {
        controlPersis.modificarVenta(venta);
    }
    
    public Cliente buscarClienteDni(int dniCliente) {
        List<Cliente> listarCliente = listarCliente();
        Cliente cliente = new Cliente();
        for(Cliente c : listarCliente){
            if(c.getDni() == dniCliente){
                cliente = c;
            }
        }
        return cliente;
    }
    //</editor-fold> (Clase Venta)

    

    

}
