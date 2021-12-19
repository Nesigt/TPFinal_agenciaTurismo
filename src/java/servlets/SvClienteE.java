
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet(name = "SvClienteE", urlPatterns = {"/SvClienteE"})
public class SvClienteE extends HttpServlet {

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
        //Declaración y asignación de variables para Cliente
        int id = Integer.parseInt(request.getParameter("id"));
        
        Controladora control = new Controladora();
        //Eliminación del cliente
        if(!control.clienteExisteVenta(id)){
            control.eliminarCliente(id);
            request.getSession().setAttribute("listarClientes", control.listarCliente());
        }
        //Redirección a Modificar/Listar Clientes
        response.sendRedirect("editarClientes.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
