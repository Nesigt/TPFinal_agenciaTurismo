
package servlets;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Servicio;

@WebServlet(name = "SvServicioM", urlPatterns = {"/SvServicioM"})
public class SvServicioM extends HttpServlet {

    Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Declaración y asignación de variables para Servicio
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String destinoServicio = request.getParameter("destinoServicio");
        Date fechaServicio = Date.valueOf(request.getParameter("fechaServicio"));
        double costoServicio = Double.parseDouble(request.getParameter("costoServicio"));
        
        //Asignación de los nuevos valores para Servicio
        Servicio servicio = control.buscarServicio(id);
        servicio.setNombre(nombre);
        servicio.setDescripcion(descripcion);
        servicio.setDestinoServicio(destinoServicio);
        servicio.setFechaServicio(fechaServicio);
        servicio.setCostoServicio(costoServicio);
        //Modificación del servicio
        control.modificarServicio(servicio);
        request.getSession().setAttribute("listarServicios", control.listarServicio());
        //Redirección a Modificar/Listar Servicios
        response.sendRedirect("editarServicios.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Declaración y asignación de variables para Servicio
        int id = Integer.parseInt(request.getParameter("id"));
        //Busqueda del servicio
        Servicio servicio = control.buscarServicio(id);
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("servicio", servicio);
        //Redirección a Modificar/Listar Servicio
        response.sendRedirect("modificarServicio.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
