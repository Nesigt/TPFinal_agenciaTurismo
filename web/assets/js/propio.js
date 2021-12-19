//Habilito o deshabilito el select de servicio y el select de paquete de altaVenta.jsp
function servicioPaquete(value)
{
    if(value==true)
    {
        document.getElementById("selectServicio").disabled=false;
        document.getElementById("selectPaquete").disabled=true;
    }else if(value==false){
        // deshabilitamos
        document.getElementById("selectServicio").disabled=true;
        document.getElementById("selectPaquete").disabled=false;
    }
}

