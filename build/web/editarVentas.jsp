<%-- 
    Document   : editarVentas
    Created on : 16/12/2021, 23:32:24
    Author     : gianm
--%>

<%@page import="logica.Servicio"%>
<%@page import="logica.Paquete"%>
<%@page import="java.sql.Date"%>
<%@page import="logica.Venta"%>
<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Modificar/Listar Ventas</title>
    </head>
    <body id="bodyInicio">
        <%HttpSession sesion = request.getSession(true);
        String nombreUsu = (String) sesion.getAttribute("usuario");
        if(nombreUsu != null){%>
            <form style="display:inline">
                <section class="form-alta" id="form-editar-cliente">
                    <h4>MODIFICAR/LISTAR VENTAS</h4>
                    <div class="form-editar-clienteE">
                        <%Controladora control = new Controladora();%>
                        <%List<Venta> listarVenta = control.listarVenta();%>
                        <table>
                            <H5>Ventas con paquetes</H5>
                            <thead>
                                <th>DNI del cliente</th>
                                <th>Fecha venta</th>
                                <th>Medio de pago</th>
                                <th>Servicios del paquete</th>
                                <th>Descripción del servicio del paquete</th>
                                <th>Precio ($)</th>
                                <th>Modificar</th>
                                <th>Eliminar</th>
                            </thead>
                            <tbody>
                                <%for(Venta venta : listarVenta){
                                    if(venta.getPaquete() != null){%>
                                    <tr>
                                        <!--DNI del Cliente-->
                                        <%int dniCliente = venta.getCliente().getDni();%>
                                        <td><%=dniCliente%></td>
                                        <!--Fecha de la venta-->
                                        <%Date fechaVenta = venta.getFechaVenta();%>
                                        <td><%=fechaVenta%></td>
                                        <!--Medio de pago-->
                                        <%String medioPago = venta.getMedioPago();%>
                                        <td><%=medioPago%></td>
                                        <!--Paquete-->
                                        <%Paquete paquete = venta.getPaquete();
                                        List<Servicio> listaServicio = paquete.getListaServicio();%>
                                        <!--Nombre del servicio-->
                                        <td>
                                            <%for(Servicio servicio : listaServicio){
                                                String nombrePaquete = servicio.getNombre();%>
                                                <%=nombrePaquete%>
                                                <br>
                                            <%}%>
                                        </td>
                                        <!--Descripcion breve del servicio-->
                                        <td>
                                            <%for(Servicio servicio : listaServicio){
                                                String descripcionPaquete = servicio.getDescripcion();%>
                                                <%=descripcionPaquete%>
                                                <br>
                                            <%}%>
                                        </td>
                                        <!--Precio de la venta-->
                                        <%double costoPaquete = paquete.getCostoPaquete();%>
                                        <td><%=costoPaquete%></td>
                                        <%int id = venta.getNumVenta();%>
                                        <!--Modificar-->
                                        <td>
                                            <form action="SvVentaM" method="POST" style="display:inline">
                                                <input type="hidden" name="id" value="<%=id%>"/>
                                                <button type="submit" class="editarClasesBoton" data-title="Edit" style="display:inline">Modificar</button>
                                            </form>
                                        </td>
                                        <!--Eliminar-->
                                        <td>
                                            <form action="SvVentaE" method="POST" style="display:inline">
                                                <input type="hidden" name="id" value="<%=id%>"/>
                                                <button type="submit" class="editarClasesBoton" id="editarClasesBotonAtras" data-title="Delete" style="display:inline">Eliminar</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <%}%>
                                <%}%>
                            </tbody>
                        </table>
                        <table>
                            <H5>Ventas con servicios</H5>
                            <thead>
                                <th>DNI del cliente</th>
                                <th>Fecha venta</th>
                                <th>Medio de pago</th>
                                <th>Nombre del servicios</th>
                                <th>Descripción del servicio</th>
                                <th>Precio ($)</th>
                                <th>Modificar</th>
                                <th>Eliminar</th>
                            </thead>
                            <tbody>
                                <%for(Venta venta : listarVenta){
                                    if(venta.getServicio() != null){%>
                                    <tr>
                                        <!--DNI del Cliente-->
                                        <%int dniCliente = venta.getCliente().getDni();%>
                                        <td><%=dniCliente%></td>
                                        <!--Fecha de la venta-->
                                        <%Date fechaVenta = venta.getFechaVenta();%>
                                        <td><%=fechaVenta%></td>
                                        <!--Medio de pago-->
                                        <%String medioPago = venta.getMedioPago();%>
                                        <td><%=medioPago%></td>
                                        <!--Nombre del Servicio-->
                                        <%Servicio servicio = venta.getServicio();
                                        String nombreServicio = servicio.getNombre();%>
                                        <td><%=nombreServicio%></td>
                                        <%String descripcionServicio = servicio.getNombre();%>
                                        <td><%=descripcionServicio%></td>
                                        <!--Precio de la venta-->
                                        <%double costoServicio = servicio.getCostoServicio();%>
                                        <td><%=costoServicio%></td>
                                        <%int id = venta.getNumVenta();%>
                                        <!--Modificar-->
                                        <td>
                                            <form action="SvVentaM" method="POST" style="display:inline">
                                                <input type="hidden" name="id" value="<%=id%>"/>
                                                <button type="submit" class="editarClasesBoton" data-title="Edit" style="display:inline">Modificar</button>
                                            </form>
                                        </td>
                                        <!--Eliminar-->
                                        <td>
                                            <form action="SvVentaE" method="POST" style="display:inline">
                                                <input type="hidden" name="id" value="<%=id%>"/>
                                                <button type="submit" class="editarClasesBoton" id="editarClasesBotonAtras" data-title="Delete" style="display:inline">Eliminar</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <%}%>
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