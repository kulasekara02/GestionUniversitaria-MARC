<?php
//Includes
require_once ('includes/funciones.php');

//Se recoge el dni del alumno
$dni = $_POST['dni'];

//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Se obtienen los eventos de $dni llamando a la función 'getEventos'
$eventos = getEventos($conexion, $dni);

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);

//Se recorren todos los eventos y se muestran
$mensaje = "";
if (isset($eventos)) {
	$i = 0;
	foreach ($eventos as $evento) {
		$mensaje .= '<div class="filaEv" id="'.$i.'">
						<b>'.$evento["FECHA"].'</b> '.$evento["NOMBRE"].'
						<input type="hidden" name="oid_e" value="'.$evento["OID_E"].'" />
						<input type="hidden" class="nfila" value="'.$i.'"/> 
						<div class="eliminarEv" id="'.$evento["OID_E"].'">X</div>
					</div><br />';
		$i++;
	}
} else {
	$mensaje = "No hay eventos";
}

echo $mensaje;
?>