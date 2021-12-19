
package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Paquete;
import logica.Servicio;

@WebServlet(name = "SvPaqueteM", urlPatterns = {"/SvPaqueteM"})
public class SvPaqueteM extends HttpServlet {
    
    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Declaración y asignación de variables para Paquete
        int id = Integer.parseInt(request.getParameter("id"));
        String[] listaServicios = request.getParameterValues("aniadirServicio");

        if(listaServicios != null){
            Paquete paquete = control.buscarPaquete(id);
            double costoPaquete = 0;
            Servicio servicio = new Servicio();
            List<Servicio> listaServicio = new ArrayList<>();
            for (String lista : listaServicios) {
                servicio = control.buscarServicio(Integer.parseInt(lista));
                costoPaquete += servicio.getCostoServicio();
                listaServicio.add(servicio);
            }
            if(listaServicio.size() >= 2){
                //Asignación de los nuevos valores para Paquete
                paquete.setListaServicio(listaServicio);
                paquete.setCostoPaquete(costoPaquete);
                //Modificación del paquete
                control.modificarPaquete(paquete);
                request.getSession().setAttribute("listarPaquete", control.listarPaquete());
                //Redirección a Modificar/Listar Paquetes
                response.sendRedirect("editarPaquetes.jsp");
            }else{
                //Redirección a Modificar Paquete
                response.sendRedirect("modificarPaquetes.jsp");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Declaración y asignación de variables para Paquete
        int id = Integer.parseInt(request.getParameter("id"));
        //Busqueda del paquete
        Paquete paquete = control.buscarPaquete(id);
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("paquete", paquete);
        //Redirección a Modificar/Listar Paquete
        response.sendRedirect("modificarPaquetes.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
