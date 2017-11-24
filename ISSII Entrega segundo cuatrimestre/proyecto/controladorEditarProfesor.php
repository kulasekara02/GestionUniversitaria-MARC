<?php
//Inicio de sesiones
session_start();

//Includes
require_once ('includes/funciones.php');

//Se comprueba que viene del formulario de edición de profesor y en tal caso, se meten los datos del formulario en la variable $dato, en caso contrario, se redirige a la página de editarPerfilProfesor
if (isset($_REQUEST["DNI"])) {
	$dato["DNI"] = $_REQUEST["DNI"];
	$dato["nombre"] = $_REQUEST["nombre"];
	$dato["apellidos"] = $_REQUEST["apellidos"];
	$dato["fechaNacimiento"] = $_REQUEST["fechaNacimiento"];
	$dato["email"] = $_REQUEST["email"];
	$dato["categoria"] = $_REQUEST["categoria"];
	$dato["despacho"] = $_REQUEST["despacho"];
	$dato["departamento"] = $_REQUEST["departamento"];
	$dni = $dato["DNI"];
} else {
	header("Location: editarPerfilProfesor.php");
}

//Se mete en la sesion de dato la información de $dato
$_SESSION["dato"] = $dato;

//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Si se ha pulsado el botón de editar despacho, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesor
if (isset($_REQUEST["editarDespacho"])) {
	$_SESSION["modificarDespacho"] = $dato["despacho"];
	header("Location: editarPerfilProfesor.php");
}

//Si se ha pulsado el botón de grabar despacho, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesor
if (isset($_REQUEST["grabarDespacho"])) {
	$oid_d = getOIDDespacho($conexion, $_REQUEST["modificarDespacho"]);
	if ($oid_d['OID_D'] == NULL) {
		$errores = "El despacho no existe.";
		$_SESSION['errores'] = $errores;
		header('Location: editarPerfilProfesor.php');
	}
	modificarDespacho($conexion, $dni, $oid_d['OID_D']);
	header("Location: editarPerfilProfesor.php");

} 

//Si se ha pulsado el botón de cancelar. se eliminará la sesión de modificar y se redirigirá a la página de editarPerfilProfesor
if (isset($_REQUEST["cancelarDespacho"])) {
	unset($_SESSION["modificarDespacho"]);
	header("Location:editarPerfilProfesor.php");

} 

//Si se ha pulsado el botón de editar departamento, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesor
if (isset($_REQUEST["editarDepartamento"])) {
	$_SESSION["modificarDepartamento"] = $dato["departamento"];
	header("Location: editarPerfilProfesor.php");
}

//Si se ha pulsado el botón de grabar departamento, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesor
if (isset($_REQUEST["grabarDepartamento"])) {
	modificarDepartamento($conexion, $dni, $_REQUEST["departamento"]);
	header("Location: editarPerfilProfesor.php");
} 

//Si se ha pulsado el botón de cancelar. se eliminará la sesión de modificar y se redirigirá a la página de editarPerfilProfesor
if (isset($_REQUEST["cancelarDepartamento"])) {
	unset($_SESSION["modificarDepartamento"]);
	header("Location: editarPerfilProfesor.php");
} 

//Si se ha pulsado el botón de editar categoría, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesor
if (isset($_REQUEST["editarCategoria"])) {
	$_SESSION["modificarCategoria"] = $dato["categoria"];
	header("Location: editarPerfilProfesor.php");
}

//Si se ha pulsado el botón de grabar categoría, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesor
if (isset($_REQUEST["grabarCategoria"])) {
	modificarCategoria($conexion, $dni, $_REQUEST["categoria"]);
	header("Location: editarPerfilProfesor.php");
} 

//Si se ha pulsado el botón de cancelar. se eliminará la sesión de modificar y se redirigirá a la página de editarPerfilProfesor
if (isset($_REQUEST["cancelarCategoria"])) {
	unset($_SESSION["modificarCategoria"]);
	header("Location: editarPerfilProfesor.php");
} 

//Si se ha pulsado el botón de editar horario, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesor
if (isset($_REQUEST["editarHorario"])) {
	$_SESSION["modificarHorario"] = $_REQUEST["editarHorario"];
	header("Location: editarPerfilProfesor.php");
}

//Si se ha pulsado el botón de grabar horario, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesor
if (isset($_REQUEST["grabarHorario"])) {
	modificarHorario($conexion, $_REQUEST["OID_H"], $_REQUEST["modificarHorarioInicioTutorias"], $_REQUEST["modificarHorarioFinTutorias"]);
	header("Location: editarPerfilProfesor.php");
} 

//Si se ha pulsado el botón de cancelar. se eliminará la sesión de modificar y se redirigirá a la página de editarPerfilProfesor
if (isset($_REQUEST["cancelarHorario"])) {
	unset($_SESSION["modificarHorario"]);
	header("Location: editarPerfilProfesor.php");
} 

//Si se ha pulsado el botón de editar día, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesor
if (isset($_REQUEST["editarDia"])) {
	$_SESSION["modificarDia"] = $_REQUEST["editarDia"];
	header("Location: editarPerfilProfesor.php");
}

//Si se ha pulsado el botón de grabar día, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesor
if (isset($_REQUEST["grabarDia"])) {
	modificarDiaTutoria($conexion, $_REQUEST["OID_H"], $_REQUEST["modificarDia"]);
	header("Location: editarPerfilProfesor.php");
} 

//Si se ha pulsado el botón de cancelar. se eliminará la sesión de modificar y se redirigirá a la página de editarPerfilProfesor
if (isset($_REQUEST["cancelarDia"])) {
	unset($_SESSION["modificarDia"]);
	header("Location: editarPerfilProfesor.php");
} 

//Si se ha pulsado el botón de cancelar. se eliminará la sesión de modificar y se redirigirá a la página de editarPerfilProfesor
if (isset($_REQUEST["eliminarTutoria"])) {
	eliminarHorario($conexion, $_REQUEST["eliminarTutoria"]);
	header("Location: editarPerfilProfesor.php");
}

//En el caso de que haya errores, se redirige a la página de editarPerfilProfesor y se muestran los errores, en caso contrario se redirige a la página de editarPerfilProfesor
if (count($errores) > 0) {
	$_SESSION['errores'] = $errores;
	header('Location: editarPerfilProfesor.php');
} else {
	unset($_SESSION['errores']);
	header('Location: editarPerfilProfesor.php');
}

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);

?>
