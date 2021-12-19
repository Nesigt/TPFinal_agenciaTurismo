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

@WebServlet(name = "SvEmpleadoA", urlPatterns = {"/SvEmpleadoA"})
public class SvEmpleadoA extends HttpServlet {
    Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Declaración y asignación de variables para Empleado
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String direccion = request.getParameter("direccion");
        int dni = Integer.parseInt(request.getParameter("dni"));
        Date fechaNac = Date.valueOf(request.getParameter("fechaNac"));
        String nacionalidad = request.getParameter("nacionalidad");
        String celular = request.getParameter("celular");
        String email = request.getParameter("email");
        String cargo = request.getParameter("cargo");
        double sueldo = Double.parseDouble(request.getParameter("sueldo"));
        String nombreUsu = request.getParameter("nombreUsu");
        String contraseniaUsu = request.getParameter("contraseniaUsu");
        //Validación de datos
        if(!control.empleadoDniExiste(dni)) {
            if(!control.buscarUsuarioEmpleado(nombreUsu)){
                Date fechaActual = new Date(Calendar.getInstance().getTime().getTime());
                if(fechaActual.after(fechaNac)){
                    //Creación del empleado
                    control.crearEmpleado(nombre, apellido, direccion, dni, fechaNac, nacionalidad, celular, email, cargo, sueldo, nombreUsu, contraseniaUsu);
                }
            }
        }
        //Redirección a Alta de Empleado
        response.sendRedirect("altaEmpleados.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
