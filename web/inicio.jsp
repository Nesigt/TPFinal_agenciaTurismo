<%-- 
    Document   : login
    Created on : 13/12/2021, 14:45:01
    Author     : gianm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Inicio</title>
    </head>
    <body id="bodyInicio">
        <%HttpSession sesion = request.getSession(true);
        String nombreUsu = (String) sesion.getAttribute("usuario");
        if(nombreUsu != null){%>
            <section class="form-inicio">
                <div id="titulo"><h4>AGENCIA DE TURISMO</h4></div>
                <div class="tarjeta">
                    <header class="header">
                        <img src="assets/img/cliente.png" class="imagen">
                    </header>
                    <h1>CLIENTE</h1>
                    <a href="altaClientes.jsp">Dar de alta</a><br>
                    <a href="editarClientes.jsp">Modificar/Listar</a>
                </div>
                <div class="tarjeta">
                    <header class="header">
                        <img src="assets/img/empleado.png" class="imagen">
                    </header>
                    <h1>EMPLEADO</h1>
                    <a href="altaEmpleados.jsp">Dar de alta</a><br>
                    <a href="editarEmpleados.jsp">Modificar/Listar</a>
                </div>
                <div class="tarjeta">
                    <header class="header">
                        <img src="assets/img/servicio.png" class="imagen">
                    </header>
                    <h1>SERVICIO</h1>
                    <a href="altaServicios.jsp">Dar de alta</a><br>
                    <a href="editarServicios.jsp">Modificar/Listar</a>
                </div>
                <div class="tarjeta">
                    <header class="header">
                        <img src="assets/img/paquete.png" class="imagen">
                    </header>
                    <h1>PAQUETE</h1>
                    <a href="altaPaquetes.jsp">Dar de alta</a><br>
                    <a href="editarPaquetes.jsp">Modificar/Listar</a>
                </div>
                <div class="tarjeta" id="venta">
                    <header class="header">
                        <img src="assets/img/venta.png" class="imagen">
                    </header>
                    <h1>VENTA</h1>
                    <a href="altaVentas.jsp">Dar de alta</a><br>
                    <a href="editarVentas.jsp">Modificar/Listar</a>
                </div>
                <!--Botón "Salir"-->
                <form action="SvInicio" method="POST">
                    <button id="inicioBotonSalir">Salir</button>
                </form>
            </section>
        <%}else{
            response.sendRedirect("index.jsp");
        }%>
    </body>
</html>