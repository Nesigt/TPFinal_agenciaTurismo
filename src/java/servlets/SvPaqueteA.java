package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet(name = "SvPaqueteA", urlPatterns = {"/SvPaqueteA"})
public class SvPaqueteA extends HttpServlet {
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
        //Declaración y asignación de variables para Paquete
        String[] listaServicios = request.getParameterValues("aniadirServicio");
        //Validación de datos
        if(listaServicios != null){
            if(listaServicios.length >= 2){
                ///Creación del paquete
                control.crearPaquete(listaServicios);
            }
        }
        //Redirección a Alta de Paquete
        response.sendRedirect("altaPaquetes.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
