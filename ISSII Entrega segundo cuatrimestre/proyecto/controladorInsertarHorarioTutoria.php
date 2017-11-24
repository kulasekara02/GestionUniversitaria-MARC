<?php
//Inicio de sesiones
session_start();

//Includes
require_once ('includes/funciones.php');

//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Se crea el array de errores
$errores = array();

//Se realizan los controles de los horario de tutorias y si sucede algo inesperado, se redirige a la página de excepción
if (!isset($_REQUEST["inputHoraInicio"]) || $_REQUEST["inputHoraInicio"] == "") {
	$errores[] = "La hora de inicio no puede estar vacía";
} elseif (!preg_match("/(2[0-4]|[01][1-9]|10):([0-5][0-9])/", $_REQUEST["inputHoraInicio"])) {
	$errores[] = "La hora de inicio debe estar en el formato correcto";
}

if (!isset($_REQUEST["inputHoraFin"]) || $_REQUEST["inputHoraFin"] == "") {
	$errores = "La hora de inicio no puede estar vacía";
} elseif (!preg_match("/(2[0-4]|[01][1-9]|10):([0-5][0-9])/", $_REQUEST["inputHoraFin"])) {
	$errores[] = "La fecha debe estar en el formato correcto";
}
if (strtotime(date('h:M', $_REQUEST["inputHoraFin"])) - strtotime(date('h:M', $_REQUEST["inputHoraInicio"])) > 0) {
	$errores[] = "La hora de inicio no puede ser despues de la hora fin";
}
if (!isset($_REQUEST["inputDia"]) || $_REQUEST["inputDia"] == "") {
	$errores[] = "La hora de inicio no puede estar vacía";
}
if (count($errores) > 0) {
	$_SESSION['errores'] = $errores;
	header('Location: excepcion.php');
} else {
	unset($_SESSION['errores']);
	aniadirHorarioTutoria($conexion, $_REQUEST["inputHoraInicio"], $_REQUEST["inputHoraFin"], $_REQUEST["inputDia"], $_REQUEST["DNI"]);
	
	if(isset($_REQUEST["noAdmin"])){
		header('Location: editarPerfilProfesor.php');
	}else{
		header('Location: editarPerfilProfesorAdmin.php');
	}
	
	
}

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);
?>