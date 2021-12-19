
package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Cliente;
import logica.Empleado;
import logica.Paquete;
import logica.Servicio;
import logica.Usuario;
import logica.Venta;
import persistencia.exceptions.NonexistentEntityException;

public class ControladoraPersistencia {
    EmpleadoJpaController empleadoJPA = new EmpleadoJpaController();
    UsuarioJpaController usuarioJPA = new UsuarioJpaController();
    ClienteJpaController clienteJPA = new ClienteJpaController();
    ServicioJpaController servicioJPA = new ServicioJpaController();
    PaqueteJpaController paqueteJPA = new PaqueteJpaController();
    VentaJpaController ventaJPA = new VentaJpaController();
    
    public void crearEmpleado(Empleado empleado, Usuario usuario){
        usuarioJPA.create(usuario);
        empleadoJPA.create(empleado);
    }

    public List<Empleado> listarEmpleado() {
        return empleadoJPA.findEmpleadoEntities();
    }

    public Empleado buscarEmpleado(int id) {
        return empleadoJPA.findEmpleado(id);
    }

    public void eliminarEmpleado(int id) {
        try {
            empleadoJPA.destroy(id);
        } catch (Exception e) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void modificarEmpleado(Empleado empleado) {
        try {
            empleadoJPA.edit(empleado);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Usuario> listarUsuario() {
        return usuarioJPA.findUsuarioEntities();
    }
    
    public void eliminarUsuario(int idUsuario) {
        try {
            usuarioJPA.destroy(idUsuario);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void modificarUsuario(Usuario usuario) {
        try {
            usuarioJPA.edit(usuario);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearCliente(Cliente cliente) {
        clienteJPA.create(cliente);
    }

    public List<Cliente> listarCliente() {
        return clienteJPA.findClienteEntities();
    }

    public Cliente buscarCliente(int id) {
        return clienteJPA.findCliente(id);
    }
    
    public void eliminarCliente(int id) {
        try {
            clienteJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void modificarCliente(Cliente cliente) {
        try {
            clienteJPA.edit(cliente);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearServicio(Servicio servicio) {
        servicioJPA.create(servicio);
    }

    public List<Servicio> listarServicio() {
        return servicioJPA.findServicioEntities();
    }
    
    public Servicio buscarServicio(int id) {
        return servicioJPA.findServicio(id);
    }

    public void eliminarServicio(int id) {
        try {
            servicioJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void modificarServicio(Servicio servicio) {
        try {
            servicioJPA.edit(servicio);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearPaquete(Paquete paquete) {
        paqueteJPA.create(paquete);
    }

    public List<Paquete> listarPaquete() {
        return paqueteJPA.findPaqueteEntities();
    }
    
    public Paquete buscarPaquete(int id) {
        return paqueteJPA.findPaquete(id);
    }

    public void eliminarPaquete(int id) {
        try {
            paqueteJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void modificarPaquete(Paquete paquete) {
        try {
            paqueteJPA.edit(paquete);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void crearVenta(Venta venta) {
        ventaJPA.create(venta);
    }

    public List<Venta> listarVenta() {
        return ventaJPA.findVentaEntities();
    }

    public void eliminarVenta(int id) {
        try {
            ventaJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Venta buscarVenta(int id) {
        return ventaJPA.findVenta(id);
    }

    public void modificarVenta(Venta venta) {
        try {
            ventaJPA.edit(venta);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
