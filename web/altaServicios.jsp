<%-- 
    Document   : altaServicios
    Created on : 12/12/2021, 21:35:18
    Author     : gianm
--%>

<%@page contentType="text/html"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Alta de Servicios</title>
    </head>
    <body id="bodyInicio">
        <%HttpSession sesion = request.getSession(true);
        String nombreUsu = (String) sesion.getAttribute("usuario");
        if(nombreUsu != null){%>
            <form action="SvServicioA" method="POST">
                <section class="form-alta">
                    <h4>ALTA DE SERVICIOS</h4>
                    <!--'Nombre' del Servicio-->
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
                    <input required class="altaClases" type="text" name="descripcion" placeholder="Breve descripci&oacute;n...">
                    <!--Destino del servicio-->
                    <input required class="altaClases" type="text" name="destinoServicio" placeholder="Lugar de destino...">
                    <!--Fecha del servicio-->
                    <input required class="altaClases" type="date" name="fechaServicio" title="Fecha del servicio...">
                    <!--Costo del servicio-->
                    <input required class="altaClases" id="numerosAltaClases" type="number" min="0" name="costoServicio" placeholder="Precio ($) del servicio...">
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

