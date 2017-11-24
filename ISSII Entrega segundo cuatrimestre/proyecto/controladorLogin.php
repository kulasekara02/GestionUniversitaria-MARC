<?php
//Inicio de sesiones
session_start();

//Includes
include_once ('includes/funciones.php');

//Se insertan los datos obtenidos del formulario en la variable $usuario
$usuario['usuario'] = $_REQUEST['DNI'];
$usuario['contrasenia'] = $_REQUEST['pass'];

//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Se validan los datos anteriores llamando a la función "validacionLogin" de manera que podermos obtener los errores si los hay
$errores = validacionLogin($conexion, $usuario);

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);

//En el caso de que haya errores, se redirige a la página de login y se muestran los errores, en caso contrario se redirige a la página de inicio con los datos del usuario
if (count($errores) > 0) {
	$_SESSION['errores'] = $errores;
	header('Location: login.php');
} else {
	unset($_SESSION['errores']);
	$_SESSION['DNI'] = $usuario['usuario'];
	header('Location: index.php');
}
?>