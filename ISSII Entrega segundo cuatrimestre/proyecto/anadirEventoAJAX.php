<?php
//Includes
require_once ('includes/funciones.php');

//Se recogen los datos del evento
$datos["DNI"] = $_POST['dni'];
$datos["FECHA"] = $_POST['fecha'];
$datos["NOMBRE"] = $_POST['nombre'];

//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Se añade un evento para $datos llamando a la función 'anadirEvento'
$aniadir = anadirEvento($conexion, $datos);

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);

//Se muestra un mensaje 
if (empty($datos["FECHA"])) {
	echo "Seleccione una fecha";
} else if (empty($datos["NOMBRE"])) {
	echo "Introduzca el nombre del evento";
} else if ($aniadir) {
	echo "Evento añadido correctamente";
} else {
	echo "Problema al añadir evento";
}
?>