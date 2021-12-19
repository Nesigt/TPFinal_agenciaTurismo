
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Empleado;

@WebServlet(name = "SvEmpleadoE", urlPatterns = {"/SvEmpleadoE"})
public class SvEmpleadoE extends HttpServlet {

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
        //Declaración y asignación de variables para Empleado
        int id = Integer.parseInt(request.getParameter("id"));
        Empleado empleado = control.buscarEmpleado(id);
        int idUsuario = empleado.getUsuario().getIdUsu();
        //Eliminación del empleado y su usuario
        if(!control.empleadoExisteVenta(id)){
            control.eliminarEmpleado(id);
            control.eliminarUsuario(idUsuario);
            request.getSession().setAttribute("listarEmpleados", control.listarEmpleado());
        }
        //Redirección a Modificar/Listar Empleados
        response.sendRedirect("editarEmpleados.jsp");
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
