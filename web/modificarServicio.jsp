<%-- 
    Document   : modificarServicio
    Created on : 13/12/2021, 03:56:44
    Author     : gianm
--%>

<%@page import="logica.Servicio"%>
<%@page contentType="text/html"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Modificar Servicio</title>
    </head>
    <body id="bodyInicio">
        <%HttpSession sesion = request.getSession(true);
        String nombreUsu = (String) sesion.getAttribute("usuario");
        if(nombreUsu != null){%>
            <form action="SvServicioM" method="GET">
                <section class="form-alta">
                    <h4>MODIFICAR SERVICIO</h4>
                    <%Servicio servicio = (Servicio) sesion.getAttribute("servicio");%>
                    <!--'Nombre' del servicio-->
                        <select class="altaClases" name="nombre" title="'Nombre' del Servicio...">
                        <option>Hotel por noche/s</option>
                        <option>Alquiler de auto</option>
                        <option>Pasajes de colectivo</option>
                        <option>Pasajes de avi&oacute;n</option>
                        <option>Pasajes de tren</option>
                        <option>Excursiones</option>
                        <option>Entradas a Eventos</option>
                    </select>
                    <!--Breve descripción<-->
                    <input required class="altaClases" type="text" name="descripcion" title="Breve descripci&oacute;n..." placeholder="Breve descripci&oacute;n..." value="<%=servicio.getDescripcion()%>">
                    <!--Destino del servicio-->
                    <input required class="altaClases" type="text" name="destinoServicio" title="Lugar de destino..." placeholder="Lugar de destino..." value="<%=servicio.getDestinoServicio()%>">
                    <!--Fecha del servicio-->
                    <input required class="altaClases" type="date" name="fechaServicio" title="Fecha del servicio..." value="<%=servicio.getFechaServicio()%>">
                    <!--Costo del servicio-->
                    <input required class="altaClases" id="numerosAltaClases" type="number" min="0" name="costoServicio" placeholder="Precio ($) del servicio..." value="<%=servicio.getCostoServicio()%>">
                    <!--ID del servicio-->
                    <input type="hidden" name="id" value="<%=servicio.getCodigoServicio()%>">
                    <!--Botón "Regresar"-->
                    <a href="inicio.jsp"><input class="altaClasesBoton" id="altaClasesBotonAtras" type="button" value="Regresar" ></a>
                    <!--Botón "Dar de Alta"-->
                    <input class="altaClasesBoton" type="submit" value="Dar de alta">
                </section>
            </form>
        <%}else{
            response.sendRedirect("index.jsp");
        }%>
    </body>
</html>
