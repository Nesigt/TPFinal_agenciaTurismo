<%-- 
    Document   : altaPaquetes
    Created on : 13/12/2021, 04:26:01
    Author     : gianm
--%>

<%@page import="java.sql.Date"%>
<%@page import="logica.Servicio"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<%@page contentType="text/html"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Alta de Paquetes</title>
    </head>
    <body id="bodyInicio">
        <%HttpSession sesion = request.getSession(true);
        String nombreUsu = (String) sesion.getAttribute("usuario");
        if(nombreUsu != null){%>
            <form action="SvPaqueteA" method="POST" style="display:inline">
                <section class="form-alta" id="form-alta-paquete">
                    <h4>ALTA DE PAQUETES</h4>
                    <label id="costoPaquete">El costo del paquete ser&aacute; igual a la suma de todos los servicios*</label>
                    <table>
                        <thead>
                        <th>Nombre del servicio</th>
                        <th>Descripcion breve</th>
                        <th>Destino del servicio</th>
                        <th>Fecha del servicio</th>
                        <th>Consto del servicio</th>
                        <th>Añadir servicio</th>
                        </thead>
                        <tbody>
                            <%Controladora control = new Controladora();
                            List<Servicio> listarServicio = control.listarServicio();%>
                            <%for (Servicio servicio : listarServicio) {%>
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
                                <!--Seleccionado-->
                                <td>
                                    <input type="checkbox" name="aniadirServicio" value="<%=id%>">
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                    <label class="altaClasesAdvertencia2"><b>ADVERTENCIA!</b> Si selecciona menos de <b>2 servicios</b> no se dará de alta el paquete</label><br>
                    <!--Botón "Regresar"-->
                    <a href="inicio.jsp"><input class="altaClasesBoton" id="altaClasesBotonAtras" type="button" value="Regresar" ></a>
                    <!--Botón "Dar de alta"-->
                    <input class="altaClasesBoton" type="submit" value="Dar de alta">
                </section>
            </form>
        <%}else{
            response.sendRedirect("index.jsp");
        }%>
    </body>
</html>