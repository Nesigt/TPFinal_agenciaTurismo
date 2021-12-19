/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Cliente;
import logica.Controladora;

@WebServlet(name = "SvClienteM", urlPatterns = {"/SvClienteM"})
public class SvClienteM extends HttpServlet {
    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Declaración y asignación de variables para Cliente
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String direccion = request.getParameter("direccion");
        int dni = Integer.parseInt(request.getParameter("dni"));
        Date fechaNac = Date.valueOf(request.getParameter("fechaNac"));
        String nacionalidad = request.getParameter("nacionalidad");
        String celular = request.getParameter("celular");
        String email = request.getParameter("email");
        //Asignación de los nuevos valores para Cliente
        Cliente cliente = control.buscarCliente(id);
        cliente.setNombre(nombre);
        cliente.setApellido(apellido);
        cliente.setDireccion(direccion);
        cliente.setDni(dni);
        cliente.setFechaNac(fechaNac);
        cliente.setNacionalidad(nacionalidad);
        cliente.setCelular(celular);
        cliente.setEmail(email);
        //Modificación del cliente
        control.modificarCliente(cliente);
        request.getSession().setAttribute("listarClientes", control.listarCliente());
        //Redirección a Modificar/Listar Clientes
        response.sendRedirect("editarClientes.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Declaración y asignación de variables para Cliente
        int id = Integer.parseInt(request.getParameter("id"));
        //Busqueda del cliente
        Cliente cliente = control.buscarCliente(id);
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("cliente", cliente);
        //Redirección a Modificar/Listar Cliente
        response.sendRedirect("modificarClientes.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
