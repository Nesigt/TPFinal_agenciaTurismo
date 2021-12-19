
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Servicio;

@WebServlet(name = "SvServicioE", urlPatterns = {"/SvServicioE"})
public class SvServicioE extends HttpServlet {

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
        Controladora control = new Controladora();
        //Declaración y asignación de variables para Servicio
        int id = Integer.parseInt(request.getParameter("id"));
        //Eliminación del servicio
        if(!control.servicioExisteVenta(id)){
            if(!control.clienteExistePaquete(id)){
                control.eliminarServicio(id);
                request.getSession().setAttribute("listarServicio", control.listarServicio());
            }
        }
        //Redirección a Modificar/Listar Servicios
        response.sendRedirect("editarServicios.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
