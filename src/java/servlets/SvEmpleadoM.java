
package servlets;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Empleado;
import logica.Usuario;

@WebServlet(name = "SvEmpleadoM", urlPatterns = {"/SvEmpleadoM"})
public class SvEmpleadoM extends HttpServlet {
    Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Declaración y asignación de variables para Empleado
        int id = Integer.parseInt(request.getParameter("id"));
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
        Empleado empleado = control.buscarEmpleado(id);
        Usuario usuario = empleado.getUsuario();
        //Asignación de los nuevos valores para Usuario
        usuario.setNombreUsu(nombreUsu);
        usuario.setContraseniaUsu(contraseniaUsu);
        //Asignación de los nuevos valores para Empleado
        empleado.setNombre(nombre);
        empleado.setApellido(apellido);
        empleado.setDireccion(direccion);
        empleado.setDni(dni);
        empleado.setFechaNac(fechaNac);
        empleado.setNacionalidad(nacionalidad);
        empleado.setCelular(celular);
        empleado.setEmail(email);
        empleado.setCargo(cargo);
        empleado.setSueldo(sueldo);
        empleado.setUsuario(usuario);
        //Modificación del usuario y empleado
        control.modificarUsuario(usuario);
        control.modificarEmpleado(empleado);
        request.getSession().setAttribute("listarEmpleados", control.listarEmpleado());
        //Redirección a Modificar/Listar Empleados
        response.sendRedirect("editarEmpleados.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Declaración y asignación de variables para Cliente
        int id = Integer.parseInt(request.getParameter("id"));
        //Busqueda del empleado
        Empleado emple = control.buscarEmpleado(id);
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("empleado", emple);
        //Redirección a Modificar/Listar Empleado
        response.sendRedirect("modificarEmpleados.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
