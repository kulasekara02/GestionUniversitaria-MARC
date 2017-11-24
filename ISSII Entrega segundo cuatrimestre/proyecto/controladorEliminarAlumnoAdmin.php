<?php
//Inicio de sesiones
session_start();

//Includes
include_once ('includes/funciones.php');

//Se comprueba que viene del formulario de eliminar alumno y en tal caso, se mete el dni del formulario en la variable $dni, en caso contrario, se redirige a la página de buscarAlumnoEliminar
if (isset($_REQUEST["DNI"])) {
	$dni = $_REQUEST["DNI"];
} else {
	header("Location: buscarAlumnoEliminar.php");
}
	
//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Se elimina el alumno llamando a la función 'eliminarAlumno'
eliminarAlumno($conexion, $dni);
eliminarUsuario($conexion,$dni);
//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);

//Se redirige a buscarAlumnoEliminar
header("Location: buscarAlumnoEliminar.php");
?>
