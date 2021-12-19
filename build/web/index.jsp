<%-- 
    Document   : index
    Created on : 10/12/2021, 16:09:23
    Author     : gianm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Inicio de sesión</title>
    </head>
    <body id="bodyInicio">
        <form action="SvUsuario" method="POST">
            <section class="form-alta">
                <h4>INICIO DE SESIÓN</h4>
                <!--Nombre del usuario-->
                <input required class="altaClases" type="text" name="nombreUsu" placeholder="Nombre del cliente...">
                <!--Contraseña del usuario-->
                <input required class="altaClases" type="password" name="contraseniaUsu" placeholder="••••••••">
                <!--Bot�n "Dar de Alta"-->
                <button class="altaClasesBoton2" id="altaClasesBotonAtras">Conectar</button>
            </section>
        </form>
    </body>
</html>

