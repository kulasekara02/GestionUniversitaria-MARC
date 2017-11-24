<?php
//Inicio de sesiones
session_start();

//Includes
require_once ('includes/funciones.php');

//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Se realizan los controles de la tutoría y su sucede algo inesperado, se redirige a la página de excepción
if (isset($_REQUEST['confirmar'])) {
	$oid_t = $_REQUEST['confirmar'];
	aceptaTutoria($conexion, $oid_t);
	header('Location: verTutoriasProfesor.php');
} else if (isset($_REQUEST['denegar'])) {
	$oid_t = $_REQUEST['denegar'];
	rechazaTutoria($conexion, $oid_t);
	header('Location: verTutoriasProfesor.php');
} else if (isset($_REQUEST['cambiar'])) {
	$_SESSION['cambiar'] = $_REQUEST['cambiar'];
	header('Location: verTutoriasProfesor.php');
} else {
	header('Location: excepcion.php');
}

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);
?>