<%-- 
    Document   : editarServicios
    Created on : 13/12/2021, 03:44:01
    Author     : gianm
--%>

<%@page import="java.sql.Date"%>
<%@page import="logica.Servicio"%>
<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Modificar/Listar Servicios</title>
    </head>
    <body id="bodyInicio">
        <%HttpSession sesion = request.getSession(true);
        String nombreUsu = (String) sesion.getAttribute("usuario");
        if(nombreUsu != null){%>
            <form style="display:inline">
                <section class="form-alta" id="form-editar-cliente">
                    <h4>MODIFICAR/LISTAR SERVICIOS</h4>
                    <div class="form-editar-clienteE">
                        <table>
                            <thead>
                                <th>Nombre del servicio</th>
                                <th>Descripcion breve</th>
                                <th>Destino del servicio</th>
                                <th>Fecha del servicio</th>
                                <th>Consto del servicio</th>
                                <th>Modificar</th>
                                <th>Eliminar</th>
                            </thead>
                            <tbody>
                                <%Controladora control = new Controladora();
                                List<Servicio> listarServicio = control.listarServicio();
                                for(Servicio servicio : listarServicio){%>
                                    <tr>
                                        <!--Nombre del servicio-->
                                        <%String nombre = servicio.getNombre();%>
                                        <td><%=nombre%></td>
                                        <!--Descripcion breve-->
                                        <%String descripcion = servicio.getDescripcion();%>
                                        <td><%=descripcion%></td>
                                        <!--Destino del servicio-->
                                        <%String destinoServicio = servicio.getDestinoServicio();%>
                                        <td><%=destinoServicio%></td>
                                        <!--Fecha del servicio-->
                                        <%Date fechaServicio = servicio.getFechaServicio();%>
                                        <td><%=fechaServicio%></td>
                                        <!--Consto del servicio-->
                                        <%double constoServicio = servicio.getCostoServicio();%>
                                        <td><%=constoServicio%></td>
                                        <!--ID-->
                                        <%int id = servicio.getCodigoServicio();%>
                                        <!--Modificar-->
                                        <td>
                                            <form action="SvServicioM" method="POST" style="display:inline">
                                                <input type="hidden" name="id" value="<%=id%>"/>
                                                <button type="submit" class="editarClasesBoton" data-title="Edit" style="display:inline">Modificar</button>
                                            </form>
                                        </td>
                                        <!--Eliminar-->
                                        <td>
                                            <form action="SvServicioE" method="POST" style="display:inline">
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
