
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;

@WebServlet(name = "SvUsuario", urlPatterns = {"/SvUsuario"})
public class SvUsuario extends HttpServlet {

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
        //Declaración y asignación de variables para la conección
        String nombreUsu = request.getParameter("nombreUsu");
        String contraseniaUsu = request.getParameter("contraseniaUsu");
        //Verificación de usuario existente
        Controladora control = new Controladora();
        boolean usuarioExiste = control.verificarUsuario(nombreUsu, contraseniaUsu);
        if(usuarioExiste){
            //Establecemos la conección
            HttpSession sesion = request.getSession(true);
            sesion.setAttribute("usuario", nombreUsu);
            sesion.setAttribute("contrasenia", contraseniaUsu);
            //Redirección a inicio  
            response.sendRedirect("inicio.jsp");
        }else{
            //Redirección a index  
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
