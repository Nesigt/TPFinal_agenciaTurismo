<%-- 
    Document   : bajaEmpleados
    Created on : 11/12/2021, 01:39:31
    Author     : gianm
--%>

<%@page import="logica.Usuario"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@page import="logica.Empleado"%>
<%@page import="logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Modificar/Listar Empleados</title>
    </head>
    <body id="bodyInicio">
        <%HttpSession sesion = request.getSession(true);
        String usuario = (String) sesion.getAttribute("usuario");
        if(usuario != null){%>
            <form style="display:inline">
                <section class="form-alta" id="form-editar-cliente">
                    <h4>MODIFICAR/LISTAR EMPLEADOS</h4>
                    <div class="form-editar-clienteE">
                        <table>
                            <thead>
                                <th>Apellido, Nombre</th>
                                <th>DNI</th>
                                <th>Dirección</th>
                                <th>Fecha de nac.</th>
                                <th>Nacionalidad</th>
                                <th>Celular</th>
                                <th>Email</th>
                                <th>Cargo</th>
                                <th>Sueldo</th>
                                <th>Nombre usu.</th>
                                <th>Contraseña usu.</th>
                                <th>Modificar</th>
                                <th>Eliminar</th>
                            </thead>
                            <tbody>
                                <%Controladora control = new Controladora();
                                List<Empleado> listarEmpleados = control.listarEmpleado();
                                for(Empleado emple : listarEmpleados){%>
                                    <tr>
                                        <!--Apellido y Nombre-->
                                        <%String nombreCompleto = emple.getApellido() + ", " + emple.getNombre();%>
                                        <td><%=nombreCompleto%></td>
                                        <!--DNI-->
                                        <%int dni = emple.getDni();%>
                                        <td><%=dni%></td>
                                        <!--Dirección-->
                                        <%String direccion = emple.getDireccion();%>
                                        <td><%=direccion%></td>
                                        <!--Fecha de nac.-->
                                        <%Date fechaNac = emple.getFechaNac();%>
                                        <td><%=fechaNac%></td>
                                        <!--Nacionalidad-->
                                        <%String nacionalidad = emple.getNacionalidad();%>
                                        <td><%=nacionalidad%></td>
                                        <!--Celular-->
                                        <%String celular = emple.getCelular();%>
                                        <td><%=celular%></td>
                                        <!--Email-->
                                        <%String email = emple.getEmail();%>
                                        <td><%=email%></td>
                                        <!--Cargo-->
                                        <%String cargo = emple.getCargo();%>
                                        <td><%=cargo%></td>
                                        <!--Sueldo-->
                                        <%double sueldo = emple.getSueldo();%>
                                        <td><%=sueldo%></td>
                                        <!--Nombre Usuario-->
                                        <%String nombreUsu = emple.getUsuario().getNombreUsu();%>
                                        <td><%=nombreUsu%></td>
                                        <!--Contraseña Usuario-->
                                        <%String contrasenia = emple.getUsuario().getContraseniaUsu();%>
                                        <td><%=contrasenia%></td>
                                        <!--ID-->
                                        <%int id = emple.getIdEmpleado();%>
                                        <!--Modificar-->
                                        <td>
                                            <form action="SvEmpleadoM" method="POST" style="display:inline">
                                                <input type="hidden" name="id" value="<%=id%>"/>
                                                <button type="submit" class="editarClasesBoton" data-title="Edit" style="display:inline">Modificar</button>
                                            </form>
                                        </td>
                                        <!--Eliminar-->
                                        <td>
                                            <form action="SvEmpleadoE" method="POST" style="display:inline">
                                                <input type="hidden" name="id" value="<%=id%>"/>
                                                <button type="submit" class="editarClasesBoton" id="editarClasesBotonAtras" data-title="Delete" style="display:inline">Eliminar</button>
                                            </form>
                                        </td>
                                    </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                <!--Botón "Regresar"-->
                <a href="inicio.jsp" ><input class="altaClasesBoton2" id="altaClasesBotonAtras" type="button" value="Regresar" ></a>
                </section>
            </form>
        <%}else{
            response.sendRedirect("index.jsp");
        }%>
    </body>
</html>