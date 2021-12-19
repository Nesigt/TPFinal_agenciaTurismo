<%-- 
    Document   : modificarEmpleados.jsp
    Created on : 11/12/2021, 02:34:58
    Author     : gianm
--%>

<%@page import="logica.Empleado"%>
<%@page contentType="text/html"%>
<!DOCTYPE html>
<html>
    <head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/style.css">
	<title>Modificar Empleado</title>
    </head>
    <body id="bodyInicio">
        <%HttpSession sesion = request.getSession(true);
        String nombreUsu = (String) sesion.getAttribute("usuario");
        if(nombreUsu != null){%>
            <form action="SvEmpleadoM" method="GET">
                <%Empleado emple = (Empleado) sesion.getAttribute("empleado");%>
                <section class="form-alta" id="empleadoAlta">
                    <h4>MODIFICAR EMPLEADOS</h4>
                    <!--Nombre del empleado-->
                    <input required class="altaClases" id="nombreApellidoAltaClasesNombre" type="text" name="nombre" placeholder="Nombre del empleado..." value="<%=emple.getNombre()%>"/>
                    <!--Apellido del empleado-->
                    <input required class="altaClases" id="nombreApellidoAltaClasesNombre" type="text" name="apellido" placeholder="Apellido del empleado..." value="<%=emple.getApellido()%>"/>
                    <!--dirección del empleado-->
                    <input required class="altaClases" type="text" name="direccion" placeholder="Dirección del empleado..." value="<%=emple.getDireccion()%>"/>
                    <!--DNI del empleado-->
                    <input required class="altaClases" id="numerosAltaClases" type="number" min="0" name="dni" placeholder="DNI del empleado..." value="<%=emple.getDni()%>"/>
                    <!--Fecha de nacimiento del empleado-->
                    <input required class="altaClases" type="date" name="fechaNac" title="Fecha de nacimiento del empleado..." value="<%=emple.getFechaNac()%>"/>
                    <!--Nacionalidad del empleado-->
                    <input required class="altaClases" type="text" name="nacionalidad" placeholder="Nacionalidad del empleado..." value="<%=emple.getNacionalidad()%>"/>
                    <!--Celular del empleado-->
                    <input required class="altaClases" id="numerosAltaClases" type="number" min="0" name="celular" placeholder="Celular del empleado..." value="<%=emple.getCelular()%>"/>
                    <!--Email del empleado-->
                    <input required class="altaClases" type="email" name="email" placeholder="Email del empleado..." value="<%=emple.getEmail()%>"/>
                    <!--Cargo del empleado-->
                    <input required class="altaClases" type="text" name="cargo" placeholder="Cargo del empleado..." value="<%=emple.getCargo()%>"/>
                    <!--Sueldo del empleado-->
                    <input required class="altaClases" id="numerosAltaClases" type="number" name="sueldo" placeholder="Sueldo del empleado..." value="<%=emple.getSueldo()%>"/>
                    <!--Nombre de usuario del empleado-->
                    <input required class="altaClases" type="text" name="nombreUsu" placeholder="Nom. de usuario del empleado..." value="<%=emple.getUsuario().getNombreUsu()%>"/>
                    <!--Contraseña de usuario del empleado-->
                    <input required class="altaClases" type="password" name="contraseniaUsu" placeholder="********" value="<%=emple.getUsuario().getContraseniaUsu()%>"/>
                    <!--ID del empleado-->
                    <input type="hidden" name="id" value="<%=emple.getIdEmpleado()%>">
                    <!--Advertencias-->
                    <label class="altaClasesAdvertencia"><b>ADVERTENCIA!</b> Si el DNI o USUARIO existe(n) el empleado no se dará de alta</label><br>
                    <!--Botón "Regresar"-->
                    <a href="inicio.jsp"><input class="altaClasesBoton" id="altaClasesBotonAtras" type="button" value="Regresar" ></a>
                    <!--Botón "Dar de Alta"-->
                    <input class="altaClasesBoton" type="submit" value="Modificar">
                </section>
            </form>
        <%}else{
            response.sendRedirect("index.jsp");
        }%>
    </body>
</html>