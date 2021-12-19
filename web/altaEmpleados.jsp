<%-- 
    Document   : empleados
    Created on : 10/12/2021, 17:15:32
    Author     : gianm
--%>

<%@page contentType="text/html"%>
<!DOCTYPE html>
<html>
    <head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/style.css">
	<title>Alta de Empleados</title>
    </head>
    <body id="bodyInicio">
        <%HttpSession sesion = request.getSession(true);
        String nombreUsu = (String) sesion.getAttribute("usuario");
        if(nombreUsu != null){%>
            <form action="SvEmpleadoA" method="POST">
                <section class="form-alta" id="empleadoAlta">
                    <h4>ALTA DE EMPLEADOS</h4>
                    <!--Nombre del empleado-->
                    <input required class="altaClases" id="nombreApellidoAltaClasesNombre" type="text" name="nombre" placeholder="Nombre del empleado..."/>
                    <!--Apellido del empleado-->
                    <input required class="altaClases" id="nombreApellidoAltaClasesNombre" type="text" name="apellido" placeholder="Apellido del empleado..."/>
                    <!--dirección del empleado-->
                    <input required class="altaClases" type="text" name="direccion" placeholder="Dirección del empleado..."/>
                    <!--DNI del empleado-->
                    <input required class="altaClases" id="numerosAltaClases" type="number" min="0" name="dni" placeholder="DNI del empleado..."/>
                    <!--Fecha de nacimiento del empleado-->
                    <input required class="altaClases" type="date" name="fechaNac" title="Fecha de nacimiento del empleado..."/>
                    <!--Nacionalidad del empleado-->
                    <input required class="altaClases" type="text" name="nacionalidad" placeholder="Nacionalidad del empleado..."/>
                    <!--Celular del empleado-->
                    <input required class="altaClases" id="numerosAltaClases" type="number" min="0" name="celular" placeholder="Celular del empleado..."/>
                    <!--Email del empleado-->
                    <input required class="altaClases" type="email" name="email" placeholder="Email del empleado..."/>
                    <!--Cargo del empleado-->
                    <input required class="altaClases" type="text" name="cargo" placeholder="Cargo del empleado..."/>
                    <!--Sueldo del empleado-->
                    <input required class="altaClases" id="numerosAltaClases" type="number" name="sueldo" placeholder="Sueldo del empleado..."/>
                    <!--Nombre de usuario del empleado-->
                    <input required class="altaClases" type="text" name="nombreUsu" placeholder="Nom. de usuario del empleado..."/>
                    <!--Contraseña de usuario del empleado-->
                    <input required class="altaClases" type="password" name="contraseniaUsu" placeholder="********"/>
                    <label class="altaClasesAdvertencia"><b>ADVERTENCIA!</b> Si el DNI o USUARIO existe(n) el empleado no se dará de alta</label><br>
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