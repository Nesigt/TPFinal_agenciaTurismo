<%-- 
    Document   : modificarVentas
    Created on : 17/12/2021, 00:48:54
    Author     : gianm
--%>

<%@page import="logica.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="logica.Paquete"%>
<%@page import="logica.Servicio"%>
<%@page import="logica.Venta"%>
<%@page import="logica.Controladora"%>
<%@page contentType="text/html"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Modificar Venta</title>
    </head>
    <body id="bodyInicio">
        <%HttpSession sesion = request.getSession(true);
        String nombreUsu = (String) sesion.getAttribute("usuario");
        if(nombreUsu != null){%>
            <form action="SvVentaM" method="GET" style="display:inline">
                <section class="form-alta">
                    <h4>MODIFICAR VENTA</h4>
                    <%Venta venta = (Venta) sesion.getAttribute("venta");
                    Controladora control = new Controladora();%>
                    <label id="lblVenta">Servicio (check = si)</label> <input type="checkbox" name="servicioOPaquete" onchange="servicioPaquete(this.checked);" checked="checked"><br>
                    <!--Servicio-->
                    <div>
                        <%List<Servicio> listaServicio = control.listarServicio();
                        List<Paquete> listarPaquete = control.listarPaquete();%>
                        <label id="lblEmple">Servicio</label>
                        <select class="altaClases" id="selectServicio" name="servicio" title="Seleccione un Servicio...">
                            <%for(Servicio servicio : listaServicio){
                                int codigoServicio = servicio.getCodigoServicio();%>
                                <option><%=codigoServicio%></option>
                            <%}%>
                        </select>
                    </div>
                    <!--Paquete-->
                    <div class="form-group">
                        <label id="lblEmple">Paquete</label>
                        <select class="altaClases" id="selectPaquete" disabled="true" name="paquete" title="Seleccione un Paquete...">
                            <%for (Paquete paquete : listarPaquete) {
                                int codigoPaquete = paquete.getCodigoPaquete();%>
                                <option><%=codigoPaquete%></option>
                            <%}%>
                        </select>
                    </div>
                    <!--Cliente-->
                    <div class="form-group">
                        <label id="lblEmple">Cliente (DNI)</label>
                        <select class="altaClases" name="cliente" title="Seleccione un Cliente...">
                            <%List<Cliente> listaCliente = control.listarCliente();
                            for(Cliente cliente : listaCliente){
                                int dni = cliente.getDni(); %>
                                <option><%=dni%></option>
                            <%}%>
                            </select>
                    </div>
                    <!--Medio de pago-->
                    <div class="form-group">
                        <label id="lblEmple">Metodo de pago </label>
                        <select class="altaClases" name="medioPago" title="'Seleccione un Medio de Pago...">
                            <option>Tarjeta de crédito</option>
                            <option>Tarjeta de débito</option>
                            <option>Efectivo</option>
                            </select>
                    </div>
                    <!--ID de la venta-->
                    <input type="hidden" name="id" value="<%=venta.getNumVenta()%>">
                    <!--Botón "Regresar"-->
                    <a href="inicio.jsp"><input class="altaClasesBoton" id="altaClasesBotonAtras" type="button" value="Regresar" ></a>
                    <!--Botón "Dar de Alta"-->
                    <input class="altaClasesBoton" type="submit" value="Modificar">
                    </form>
                </section>
            </form>
        <script src="assets/js/propio.js"></script>
        <%}else{
            response.sendRedirect("index.jsp");
        }%>
    </body>
</html>