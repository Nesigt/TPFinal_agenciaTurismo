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
import logica.Controladora;

@WebServlet(name = "SvVentaA", urlPatterns = {"/SvVentaA"})
public class SvVentaA extends HttpServlet {
        Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Declaración y asignación de variables para Venta
        Date fechaVenta = new Date(Calendar.getInstance().getTime().getTime());
        String medioPago = request.getParameter("medioPago");
        String servicioOPaquete = request.getParameter("servicioOPaquete");
        int CodigoPaquete = -1;
        int CodigoServicio = -1;
        if(servicioOPaquete == null){
            CodigoPaquete = Integer.parseInt(request.getParameter("paquete"));
        }else{
            CodigoServicio = Integer.parseInt(request.getParameter("servicio"));
        }
        int dniCliente = Integer.parseInt(request.getParameter("cliente"));
        //Obtención de los datos de la sesión para obtener el empleado
        HttpSession sesion = request.getSession(true);
        String nombreUsu = (String) sesion.getAttribute("usuario");
        String contraseniaUsu = (String) sesion.getAttribute("contrasenia");
        ///Creación de la venta
        control.crearVenta(fechaVenta, medioPago, CodigoPaquete, CodigoServicio, dniCliente, nombreUsu, contraseniaUsu);
        //Redirección a Alta de Venta
        response.sendRedirect("altaVentas.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
