
package servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Cliente;
import logica.Controladora;
import logica.Empleado;
import logica.Paquete;
import logica.Servicio;
import logica.Venta;

/**

 @author gianm
 */
@WebServlet(name = "SvVentaM", urlPatterns = {"/SvVentaM"})
public class SvVentaM extends HttpServlet {
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Declaración y asignación de variables para Venta
        Venta venta = new Venta();
        int id = Integer.parseInt(request.getParameter("id"));
        Date fechaVenta = new Date(Calendar.getInstance().getTime().getTime());
        String medioPago = request.getParameter("medioPago");
        venta.setNumVenta(id);
        venta.setFechaVenta(fechaVenta);
        venta.setMedioPago(medioPago);
        //Asigno valores de Paquete y Servicio
        String servicioOPaquete = request.getParameter("servicioOPaquete");
        int CodigoPaquete = -1;
        int CodigoServicio = -1;
        Paquete paquete = new Paquete();
        Servicio servicio = new Servicio();
        if(servicioOPaquete == null){
            CodigoPaquete = Integer.parseInt(request.getParameter("paquete"));
            paquete = control.buscarPaquete(CodigoPaquete);
            venta.setPaquete(paquete);
        }else{
            CodigoServicio = Integer.parseInt(request.getParameter("servicio"));
            servicio = control.buscarServicio(CodigoServicio);
            venta.setServicio(servicio);
        }
        
        //Asigno valores de Empleado
        HttpSession sesion = request.getSession(true);
        String nombreUsu = (String) sesion.getAttribute("usuario");
        
        Empleado empleado = new Empleado();
        empleado = control.buscarUsuarioEmpleadoEmpleado(nombreUsu);
        venta.setEmpleado(empleado);
        
        //Asigno valores de Cliente
        Cliente cliente = new Cliente();
        int dniCliente = Integer.parseInt(request.getParameter("cliente"));
        cliente = control.buscarClienteDni(dniCliente);
        venta.setCliente(cliente);
        //Modifico la venta
        control.modificarVenta(venta);
        request.getSession().setAttribute("listarVentas", control.listarVenta());
        //Redirección a Modificar/Listar Venta
        response.sendRedirect("editarVentas.jsp");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Declaración y asignación de variables para Venta
        int id = Integer.parseInt(request.getParameter("id"));
        //Busqueda de la venta
        Venta venta = control.buscarVenta(id);
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("venta", venta);
        //Redirección a Modificar/Listar Venta
        response.sendRedirect("modificarVentas.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
