<%-- 
    Document   : altaVentas
    Created on : 14/12/2021, 16:19:24
    Author     : gianm
--%>

<%@page import="logica.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="logica.Paquete"%>
<%@page import="logica.Servicio"%>
<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<%@page contentType="text/html"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Alta de Ventas</title>
    </head>
    <body id="bodyInicio">
        <%HttpSession sesion = request.getSession(true);
        String nombreUsu = (String) sesion.getAttribute("usuario");
        if(nombreUsu != null){%>
            <form action="SvVentaA" method="POST" style="display:inline">
                <section class="form-alta">
                    <h4>ALTA DE VENTAS</h4>
                    <%Controladora control = new Controladora();%>
                    <label id="lblVenta">Servicio (check = si)</label> <input type="checkbox" name="servicioOPaquete" onchange="servicioPaquete(this.checked);" checked="checked"><br>
                    <!--Servicio-->
                    <%List<Servicio> listaServicio = control.listarServicio();%>
                    <label id="lblVenta">Servicio [ID]</label>
                    <select class="altaClases" id="selectServicio" name="servicio" title="Seleccione un Servicio...">
                        <%for (Servicio servicio : listaServicio) {
                            int codigoServicio = servicio.getCodigoServicio();%>
                            <option><%=codigoServicio%></option>
                        <%}%>
                    </select>
                    <!--Paquete-->
                    <%List<Paquete> listarPaquete = control.listarPaquete();%>
                    <label id="lblVenta">Paquete [ID, costo]</label>
                    <select class="altaClases" id="selectPaquete" disabled="true" name="paquete" title="Seleccione un Paquete...">
                        <%for (Paquete paquete : listarPaquete) {
                            int codigoPaquete = paquete.getCodigoPaquete();%>
                            <option><%=codigoPaquete%></option>
                        <%}%>
                    </select>
                    <!--Cliente-->
                    <label id="lblVenta">Cliente (DNI)</label>
                    <select class="altaClases" name="cliente" title="Seleccione un Cliente...">

                        <%List<Cliente> listaCliente = control.listarCliente();
                        for (Cliente cliente : listaCliente) {
                            int dni = cliente.getDni();%>
                            <option><%=dni%></option>
                        <%}%>
                    </select>
                    <!--Medio de pago-->
                    <label id="lblVenta">Metodo de pago </label>
                    <select class="altaClases" name="medioPago" title="'Seleccione un Medio de Pago...">
                        <option>Efectivo</option>
                        <option>Tarjeta de d&eacute;bito</option>
                        <option>Tarjeta de cr&eacute;dito</option>
                        <option>Monedero virtual</option>
                        <option>Transferencia</option>
                    </select>
                    <!--Botón "Regresar"-->
                    <a href="inicio.jsp"><input class="altaClasesBoton" id="altaClasesBotonAtras" type="button" value="Regresar" ></a>
                    <!--Botón "Dar de Alta"-->
                    <input class="altaClasesBoton" type="submit" value="Vender">
                    </form>
                </section>
            </form>
            <script src="assets/js/propio.js"></script>
        <%}else{
            response.sendRedirect("index.jsp");
        }%>
    </body>
</html>

