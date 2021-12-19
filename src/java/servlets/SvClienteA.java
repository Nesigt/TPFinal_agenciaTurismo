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

@WebServlet(name = "SvClienteA", urlPatterns = {"/SvClienteA"})
public class SvClienteA extends HttpServlet {
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
        //Declaración y asignación de variables para Cliente
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String direccion = request.getParameter("direccion");
        int dni = Integer.parseInt(request.getParameter("dni"));
        Date fechaNac = Date.valueOf(request.getParameter("fechaNac"));
        String nacionalidad = request.getParameter("nacionalidad");
        String celular = request.getParameter("celular");
        String email = request.getParameter("email");
        //Validación de datos
        if(!control.clienteDniExiste(dni)) {
            Date fechaActual = new Date(Calendar.getInstance().getTime().getTime());
            if(fechaActual.after(fechaNac)){
                //Creación del cliente
                control.crearCliente(nombre, apellido, direccion, dni, fechaNac, nacionalidad, celular, email);
            }
        }
        //Redirección a Alta de Clientes
        response.sendRedirect("altaClientes.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
