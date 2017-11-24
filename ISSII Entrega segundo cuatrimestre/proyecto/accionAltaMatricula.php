<?php
//Inicio de sesiones
session_start();

//Includes
require_once ('includes/funciones.php');

//Se comprueba que hemos llegado aquí por el formulario de matriculación y en tal caso se mete en la variable $usuario los datos del formulario, en caso contrario, se redirige a la página de matriculación
if (isset($_SESSION['formulario'])) {
	$usuario['dni'] = $_REQUEST['dni'];
	$usuario['sexo'] = $_REQUEST['sexo'];
	$usuario['nombre'] = $_REQUEST['nombre'];
	$usuario['apellidos'] = $_REQUEST['apellidos'];
	$usuario['email'] = $_REQUEST['email'];
	$usuario['telefono'] = $_REQUEST['telefono'];
	$usuario['fecha'] = $_REQUEST['fecha'];
	$usuario['provincia'] = $_REQUEST['provincia'];
	$usuario['direccion'] = $_REQUEST['direccion'];
	$usuario['cpostal'] = $_REQUEST['cpostal'];
	$usuario['curso'] = $_REQUEST['curso'];
	$usuario['acceso'] = getNombreFormaAcceso($_REQUEST['acceso']);
	$usuario['modalidad'] = $_REQUEST['modalidad'];
	$usuario['becas'] = $_REQUEST['becas'];
	$usuario['pass'] = $_REQUEST['pass'];
	$usuario['passConf'] = $_REQUEST['passConf'];
	$usuario['asignaturas'] = $_REQUEST['asignaturas'];
	$_SESSION['formulario'] = $usuario;
} else {
	header('Location: matriculacion.php');
}

// Validamos el formulario en servidor
$errores = validacionMatriculacion($usuario);

//En el caso de que haya errores, se redirige a la página de matriculacion y se muestran los errores, en caso contrario se redirige a la página de exitoAltaMatricula
if (count($errores) > 0) {
	$_SESSION['errores'] = $errores;
	header('Location: matriculacion.php');
} else {
	unset($_SESSION['errores']);
	header('Location: exitoAltaMatricula.php');
}
?>