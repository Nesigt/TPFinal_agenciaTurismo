<%-- 
    Document   : editarPaquetes
    Created on : 13/12/2021, 04:26:11
    Author     : gianm
--%>

<%@page import="java.sql.Date"%>
<%@page import="logica.Servicio"%>
<%@page import="logica.Paquete"%>
<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Modificar/Listar Paquetes</title>
    </head>
    <body id="bodyInicio">
        <%HttpSession sesion = request.getSession(true);
        String nombreUsu = (String) sesion.getAttribute("usuario");
        if(nombreUsu != null){%>
            <form style="display:inline">
                <section class="form-alta" id="form-editar-cliente">
                    <h4>MODIFICAR/LISTAR PAQUETES</h4>
                    <div class="form-editar-clienteE">
                        <table>
                            <thead>
                                <th>Nombre del servicio</th>
                                <th>Descripcion del servicio</th>
                                <th>Destino del servicio</th>
                                <th>Fecha del servicio</th>
                                <th>Precio del paquete</th>
                                <th>Modificar</th>
                                <th>Eliminar</th>
                            </thead>
                            <tbody>
                                <%Controladora control = new Controladora();
                                List<Paquete> listarPaquete = control.listarPaquete();
                                for(Paquete paquete : listarPaquete){%>
                                    <tr>
                                        <%List<Servicio> listarServicio = paquete.getListaServicio();%>
                                        <!--Nombre del servicio-->
                                        <td>
                                            <%for(Servicio servicio : listarServicio){
                                                String nombre = servicio.getNombre();%>
                                                <%=nombre%>
                                                <br>
                                            <%}%>
                                        </td>
                                        <!--Descripcion breve-->
                                        <td>
                                            <%for(Servicio servicio : listarServicio){
                                                String descripcion = servicio.getDescripcion();%>
                                                <%=descripcion%>
                                                <br>
                                            <%}%>
                                        </td>
                                        <!--Destino del servicio-->
                                        <td>
                                            <%for(Servicio servicio : listarServicio){
                                                String destinoServicio = servicio.getDestinoServicio();%>
                                                <%=destinoServicio%>
                                                <br>
                                            <%}%>
                                        </td>
                                        <!--Fecha del servicio-->
                                        <td>
                                            <%for(Servicio servicio : listarServicio){
                                                Date fechaServicio = servicio.getFechaServicio();%>
                                                <%=fechaServicio%>
                                                <br>
                                            <%}%>
                                        </td>
                                        <!--Costo del paquete-->
                                        <%double constoPaquete = paquete.getCostoPaquete();%>
                                        <td><%=constoPaquete%></td>
                                        <%int id = paquete.getCodigoPaquete();%>
                                        <!--Modificar-->
                                        <td>
                                            <form action="SvPaqueteM" method="POST" style="display:inline">
                                                <input type="hidden" name="id" value="<%=id%>"/>
                                                <button type="submit" class="editarClasesBoton" data-title="Edit" style="display:inline">Modificar</button>
                                            </form>
                                        </td>
                                        <!--Eliminar-->
                                        <td>
                                            <form action="SvPaqueteE" method="POST" style="display:inline">
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