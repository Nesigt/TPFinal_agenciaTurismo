<%-- 
    Document   : altaClientes
    Created on : 12/12/2021, 12:55:57
    Author     : gianm
--%>

<%@page contentType="text/html"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Alta de Clientes</title>
    </head>
    <body id="bodyInicio">
        <%HttpSession sesion = request.getSession(true);
        String nombreUsu = (String) sesion.getAttribute("usuario");
        if(nombreUsu != null){%>
        <form action="SvClienteA" method="POST">
            <section class="form-alta">
                <h4>ALTA DE CLIENTES</h4>
                <!--Nombre del cliente-->
                <input required class="altaClases" type="text" name="nombre" placeholder="Nombre del cliente...">
                <!--Apellido del cliente-->
                <input required class="altaClases" type="text" name="apellido" placeholder="Apellido del cliente...">
                <!--dirección del cliente-->
                <input required class="altaClases" type="text" name="direccion" placeholder="Dirección del cliente...">
                <!--DNI del cliente-->
                <input required class="altaClases" id="numerosAltaClases" type="number" min="0" name="dni" placeholder="DNI del cliente...">
                <!--Fecha de nacimiento del cliente-->
                <input required class="altaClases" type="date" name="fechaNac" title="Fecha de nacimiento del cliente...">
                <!--Nacionalidad del cliente-->
                <input required class="altaClases" type="text" name="nacionalidad" placeholder="Nacionalidad del cliente...">
                <!--Celular del cliente-->
                <input required class="altaClases" id="numerosAltaClases" type="number" min="0" name="celular" placeholder="Celular del cliente...">
                <!--Email del cliente-->
                <input required class="altaClases" type="email" name="email" placeholder="Email del cliente...">
                <label class="altaClasesAdvertencia"><b>ADVERTENCIA!</b> Si el DNI existe el cliente no se dará de alta</label><br>
                <!--Botón "Regresar"-->
                <a href="inicio.jsp"> <input class="altaClasesBoton" id="altaClasesBotonAtras" type="button" value="Regresar" > </a>
                <!--Botón "Dar de Alta"-->
                <input class="altaClasesBoton" type="submit" value="Dar de alta">
            </section>
        </form>
        <%}else{
            response.sendRedirect("index.jsp");
        }%>
    </body>
</html>
