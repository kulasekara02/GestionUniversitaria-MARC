<?php
//Inicio de sesiones
session_start();

//Includes
require_once ('includes/funciones.php');

//Se comprueba que hemos llegado aquí por el formulario de matriculación y en tal caso se mete en la variable $usuario los datos del formulario, en caso contrario, se redirige a la página de matriculación
if (isset($_SESSION['formulario'])) {
	$usuario['dni'] = $_REQUEST["dni"];
	$usuario['nombre'] = $_REQUEST["nombre"];
	$usuario['apellidos'] = $_REQUEST["apellidos"];
	$usuario['email'] = $_REQUEST["email"];
	$usuario['fecha'] = $_REQUEST["fecha"];
	$usuario['curso'] = $_REQUEST["curso"];
	$usuario['categoria'] = $_REQUEST["categoria"];
	$usuario['oid_dep'] = $_REQUEST["departamento"];
	$usuario['oid_d'] = $_REQUEST["despacho"];
	$usuario['pass'] = $_REQUEST["pass"];
	$usuario['passConf'] = $_REQUEST["passConf"];
	$_SESSION['formulario'] = $usuario;
} else {
	header('Location: insertarProfesorAdmin.php');
}

//Validamos el formulario en servidor
$errores = validacionInsertarProfesor($usuario);

//En el caso de que haya errores, se redirige a la página de matriculacion y se muestran los errores, en caso contrario se redirige a la página de exitoInsertarProfesorAdmin
if (count($errores) > 0) {
	$_SESSION['errores'] = $errores;
	header('Location: insertarProfesorAdmin.php');
} else {
	unset($_SESSION['errores']);
	header('Location: exitoInsertarProfesorAdmin.php');
}
?>