<%-- 
    Document   : modificarClientes
    Created on : 12/12/2021, 14:51:00
    Author     : gianm
--%>

<%@page import="logica.Cliente"%>
<%@page contentType="text/html"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Modificar Cliente</title>
    </head>
    <body id="bodyInicio">
        <%HttpSession sesion = request.getSession(true);
        String nombreUsu = (String) sesion.getAttribute("usuario");
        if(nombreUsu != null){%>
            <form action="SvClienteM" method="GET">
                <%Cliente cliente = (Cliente) sesion.getAttribute("cliente");%>
                <section class="form-alta">
                    <h4>MODIFICAR CLIENTE</h4>
                    <!--Nombre del cliente-->
                    <input required class="altaClases" type="text" name="nombre" placeholder="Nombre del cliente..." value="<%=cliente.getNombre()%>"/>
                    <!--Apellido del cliente-->
                    <input required class="altaClases" type="text" name="apellido" placeholder="Apellido del cliente..." value="<%=cliente.getApellido()%>"/>
                    <!--dirección del cliente-->
                    <input required class="altaClases" type="text" name="direccion" placeholder="Dirección del cliente..." value="<%=cliente.getDireccion()%>"/>
                    <!--DNI del cliente-->
                    <input required class="altaClases" id="numerosAltaClases" type="number" min="0" name="dni" placeholder="DNI del cliente..." value="<%=cliente.getDni()%>"/>
                    <!--Fecha de nacimiento del cliente-->
                    <input required class="altaClases" type="date" name="fechaNac" title="Fecha de nacimiento del cliente..." value="<%=cliente.getFechaNac()%>"/>
                    <!--Nacionalidad del cliente-->
                    <input required class="altaClases" type="text" name="nacionalidad" placeholder="Nacionalidad del cliente..." value="<%=cliente.getNacionalidad()%>"/>
                    <!--Celular del cliente-->
                    <input required class="altaClases" id="numerosAltaClases" type="number" min="0" name="celular" placeholder="Celular del cliente..." value="<%=cliente.getCelular()%>"/>
                    <!--Email del cliente-->
                    <input required class="altaClases" type="email" name="email" placeholder="Email del cliente..." value="<%=cliente.getEmail()%>">
                    <!--ID del cliente-->
                    <input type="hidden" name="id" value="<%=cliente.getIdCliente()%>">
                    <!--Advertencia-->
                    <label class="altaClasesAdvertencia"><b>ADVERTENCIA!</b> Si el DNI existe el cliente no se dará de alta</label><br>
                    <!--Botón "Regresar"-->
                    <a href="inicio.jsp"> <input class="altaClasesBoton" id="altaClasesBotonAtras" type="button" value="Regresar"/> </a>
                    <!--Botón "Dar de Alta"-->
                    <input class="altaClasesBoton" type="submit" value="Modificar">
                </section>
            </form>
        <%}else{
            response.sendRedirect("index.jsp");
        }%>
    </body>
</html>