
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

/**

 @author gianm
 */
@WebServlet(name = "SvPaqueteE", urlPatterns = {"/SvPaqueteE"})
public class SvPaqueteE extends HttpServlet {

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
        //Declaración y asignación de variables para Paquete
        int id = Integer.parseInt(request.getParameter("id"));
        //Eliminación del paquete
        if(!control.paqueteExisteVenta(id)){
            control.eliminarPaquete(id);
            request.getSession().setAttribute("listarPaquete", control.listarEmpleado());
        }
        //Redirección a Modificar/Listar Paquetes
        response.sendRedirect("editarPaquetes.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
