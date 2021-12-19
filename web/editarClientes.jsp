<%-- 
    Document   : editarClientes
    Created on : 12/12/2021, 13:04:14
    Author     : gianm
--%>

<%@page import="java.sql.Date"%>
<%@page import="logica.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Modificar/Listar Clientes</title>
    </head>
    <body id="bodyInicio">
        <%HttpSession sesion = request.getSession(true);
        String nombreUsu = (String) sesion.getAttribute("usuario");
        if(nombreUsu != null){%>
            <form style="display:inline">
                <section class="form-alta" id="form-editar-cliente">
                    <h4>MODIFICAR/LISTAR CLIENTES</h4>
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
                                <th >Modificar</th>
                                <th>Eliminar</th>
                            </thead>
                            <tbody>
                                <%Controladora control = new Controladora();
                                List<Cliente> listarClientes = control.listarCliente();
                                for (Cliente cliente : listarClientes) {%>
                                    <tr>
                                        <!--Apellido y Nombre-->
                                        <%String nombreCompleto = cliente.getApellido() + ", " + cliente.getNombre();%>
                                        <td><%=nombreCompleto%></td>
                                        <!--DNI-->
                                        <%int dni = cliente.getDni();%>
                                        <td><%=dni%></td>
                                        <!--Dirección-->
                                        <%String direccion = cliente.getDireccion();%>
                                        <td><%=direccion%></td>
                                        <!--Fecha de nac.-->
                                        <%Date fechaNac = cliente.getFechaNac();%>
                                        <td><%=fechaNac%></td>
                                        <!--Nacionalidad-->
                                        <%String nacionalidad = cliente.getNacionalidad();%>
                                        <td><%=nacionalidad%></td>
                                        <!--Celular-->
                                        <%String celular = cliente.getCelular();%>
                                        <td><%=celular%></td>
                                        <!--Email-->
                                        <%String email = cliente.getEmail();%>
                                        <td><%=email%></td>
                                        <!--ID-->
                                        <%int id = cliente.getIdCliente();%>
                                        <!--Modificar-->
                                        <td>
                                            <form action="SvClienteM" method="POST" style="display:inline">
                                                <input type="hidden" name="id" value="<%=id%>"/>
                                                <button type="submit" class="editarClasesBoton" data-title="Edit" style="display:inline">Modificar</button>
                                            </form>
                                        </td>
                                        <!--Eliminar-->
                                        <td>
                                            <form action="SvClienteE" method="POST" style="display:inline">
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