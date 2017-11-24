<?php
//Inicio de sesiones
session_start();

//Includes
require_once ('includes/funciones.php');

//Se comprueba que viene del formulario de edición de alumno y en tal caso, se meten los datos del formulario en la variable $dato, en caso contrario, se redirige a la página de editarAlumnoAdmin
if (isset($_REQUEST["DNI"])) {
	$dato["DNI"] = $_REQUEST["DNI"];
	$dato["nombre"] = $_REQUEST["nombre"];
	$dato["apellidos"] = $_REQUEST["apellidos"];
	$dato["fechaNacimiento"] = $_REQUEST["fechaNacimiento"];
	$dato["email"] = $_REQUEST["email"];
	$dato["OID_GRUP"] = $_REQUEST["OID_GRUP"];
	$dato["OID_G"] = $_REQUEST["OID_G"];
	$dato["CURSO"] = $_REQUEST["CURSO"];
	$dato["Telefono"] = $_REQUEST["Telefono"];
	$dato["direccion"] = $_REQUEST["direccion"];
	$dato["provincia"] = $_REQUEST["provincia"];
	$dato["Codigo_postal"] = $_REQUEST["Codigo_postal"];
	$dni = $dato["DNI"];
} else {
	header("Location: editarAlumnoAdmin.php");
}

//Se mete en la sesion de dato la información de $dato
$_SESSION["dato"] = $dato;

//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Si se ha pulsado el botón de editar nombre, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["editarNombre"])) {
	$_SESSION["modificarNombre"] = $dato["nombre"];
	header("Location: editarAlumnoAdmin.php");
}

//Si se ha pulsado el botón de grabar nombre, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["grabarNombre"])) {
	modificarNombreAlum($conexion, $dni, $_REQUEST["modificarNombre"]);
	header("Location: editarAlumnoAdmin.php");
} 

//Si se ha pulsado el botón de cancelar. se eliminará la sesión de modificar y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["cancelarNombre"])) {
	unset($_SESSION["modificarNombre"]);
	header("Location: editarAlumnoAdmin.php");
} 

//Si se ha pulsado el botón de editar apellidos, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["editarApellidos"])) {
	$_SESSION["modificarApellidos"] = $dato["apellidos"];
	header("Location: editarAlumnoAdmin.php");
}

//Si se ha pulsado el botón de grabar apellidos, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["grabarApellidos"])) {
	modificarApellidosAlum($conexion, $dni, $_REQUEST["modificarApellidos"]);
	header("Location: editarAlumnoAdmin.php");
} 

//Si se ha pulsado el botón de cancelar. se eliminará la sesión de modificar y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["cancelarApellidos"])) {
	unset($_SESSION["modificarApellidos"]);
	header("Location: editarAlumnoAdmin.php");
} 

//Si se ha pulsado el botón de editar fecha de nacimiento, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["editarFechaNacimiento"])) {
	$_SESSION["modificarFechaNacimiento"] = $dato["fechaNacimiento"];
	header("Location: editarAlumnoAdmin.php");
}

//Si se ha pulsado el botón de grabar fecha de nacimiento, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["grabarFechaNacimiento"])) {
	modificarFecha_NacimientoAlum($conexion, $dni, $_REQUEST["modificarFechaNacimiento"]);
	header("Location: editarAlumnoAdmin.php");
} 

//Si se ha pulsado el botón de cancelar. se eliminará la sesión de modificar y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["cancelarFechaNacimiento"])) {
	unset($_SESSION["modificarFechaNacimiento"]);
	header("Location: editarAlumnoAdmin.php");
}

//Si se ha pulsado el botón de editar email, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["editarEmail"])) {
	$_SESSION["modificarEmail"] = $dato["email"];
	header("Location: editarAlumnoAdmin.php");
}

//Si se ha pulsado el botón de grabar email, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["grabarEmail"])) {
	modificarEmailAlum($conexion, $dni, $_REQUEST["modificarEmail"]);
	header("Location: editarAlumnoAdmin.php");
} 

//Si se ha pulsado el botón de cancelar. se eliminará la sesión de modificar y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["cancelarEmail"])) {
	unset($_SESSION["modificarEmail"]);
	header("Location: editarAlumnoAdmin.php");
}
//Si se ha pulsado el botón de editar Telefono, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["editarTelefono"])) {
	$_SESSION["modificarTelefono"] = $dato["Telefono"];
	header("Location: editarAlumnoAdmin.php");
}

//Si se ha pulsado el botón de grabar Telefono, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["grabarTelefono"])) {
	modificarTelefonoAlum($conexion, $dni, $_REQUEST["modificarTelefono"]);
	header("Location: editarAlumnoAdmin.php");
} 

//Si se ha pulsado el botón de cancelar. se eliminará la sesión de modificar y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["cancelarTelefono"])) {
	unset($_SESSION["modificarTelefono"]);
	header("Location: editarAlumnoAdmin.php");
}
//Si se ha pulsado el botón de editar direccion, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["editardireccion"])) {
	$_SESSION["modificardireccion"] = $dato["direccion"];
	header("Location: editarAlumnoAdmin.php");
}

//Si se ha pulsado el botón de grabar direccion, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["grabardireccion"])) {
	modificardireccionAlum($conexion, $dni, $_REQUEST["modificardireccion"]);
	header("Location: editarAlumnoAdmin.php");
} 

//Si se ha pulsado el botón de cancelar. se eliminará la sesión de modificar y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["cancelardireccion"])) {
	unset($_SESSION["modificardireccion"]);
	header("Location: editarAlumnoAdmin.php");
}
//En el caso de que haya errores, se redirige a la página de editarAlumnoAdmin y se muestran los errores, en caso contrario se redirige a la página de editarAlumnoAdmin
if (count($errores) > 0) {
	$_SESSION['errores'] = $errores;
	header('Location: editarAlumnoAdmin.php');
} else {
	unset($_SESSION['errores']);
	header('Location: editarAlumnoAdmin.php');
}
//Si se ha pulsado el botón de editar provincia, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["editarprovincia"])) {
	$_SESSION["modificarprovincia"] = $dato["provincia"];
	header("Location: editarAlumnoAdmin.php");
}

//Si se ha pulsado el botón de grabar provincia, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["grabarprovincia"])) {
	modificarprovinciaAlum($conexion, $dni, $_REQUEST["modificarprovincia"]);
	header("Location: editarAlumnoAdmin.php");
} 

//Si se ha pulsado el botón de cancelar. se eliminará la sesión de modificar y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["cancelarprovincia"])) {
	unset($_SESSION["modificarprovincia"]);
	header("Location: editarAlumnoAdmin.php");
}
//Si se ha pulsado el botón de editar Codigo_postal, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["editarCodigo_postal"])) {
	$_SESSION["modificarCodigo_postal"] = $dato["Codigo_postal"];
	header("Location: editarAlumnoAdmin.php");
}

//Si se ha pulsado el botón de grabar Codigo_postal, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["grabarCodigo_postal"])) {
	modificarCodigo_postalAlum($conexion, $dni, $_REQUEST["modificarCodigo_postal"]);
	header("Location: editarAlumnoAdmin.php");
} 

//Si se ha pulsado el botón de cancelar. se eliminará la sesión de modificar y se redirigirá a la página de editarAlumnoAdmin
if (isset($_REQUEST["cancelarCodigo_postal"])) {
	unset($_SESSION["modificarCodigo_postal"]);
	header("Location: editarAlumnoAdmin.php");
}
//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);

?>
