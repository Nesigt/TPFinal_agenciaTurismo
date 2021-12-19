/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

/**

 @author gianm
 */
@WebServlet(name = "SvVentaE", urlPatterns = {"/SvVentaE"})
public class SvVentaE extends HttpServlet {

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
        processRequest(request, response);
        Controladora control = new Controladora();
        //Declaración y asignación de variables para Venta
        int id = Integer.parseInt(request.getParameter("id"));
        //Eliminación de la venta
        control.eliminarVenta(id);
        request.getSession().setAttribute("listarVenta", control.listarVenta());
        //Redirección a Modificar/Listar Ventas
        response.sendRedirect("editarVentas.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
