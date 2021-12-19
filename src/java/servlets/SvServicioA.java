package servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet(name = "SvServicioA", urlPatterns = {"/SvServicioA"})
public class SvServicioA extends HttpServlet {
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
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String destinoServicio = request.getParameter("destinoServicio");
        Date fechaServicio = Date.valueOf(request.getParameter("fechaServicio"));
        double costoServicio = Double.parseDouble(request.getParameter("costoServicio"));
        
        //Validación de datos
        Date fechaActual = new Date(Calendar.getInstance().getTime().getTime());
        if(fechaActual.before(fechaServicio)){
            //Creación del servicio
            control.crearServicio(nombre, descripcion, destinoServicio, fechaServicio, costoServicio);
        }
        //Redirección a Alta de Servicio
        response.sendRedirect("altaServicios.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
