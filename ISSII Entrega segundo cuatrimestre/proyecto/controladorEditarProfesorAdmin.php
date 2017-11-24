<?php
//Inicio de sesiones
session_start();

//Includes
require_once ('includes/funciones.php');

//Se comprueba que viene del formulario de edición de profesor y en tal caso, se meten los datos del formulario en la variable $dato, en caso contrario, se redirige a la página de editarPerfilProfesorAdmin
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
	header("Location: editarPerfilProfesorAdmin.php");
}

//Se mete en la sesion de dato la información de $dato
$_SESSION["dato"] = $dato;

//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Si se ha pulsado el botón de editar nombre, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["editarNombre"])) {
	$_SESSION["modificarNombre"] = $dato["nombre"];
	header("Location: editarPerfilProfesorAdmin.php");
}

//Si se ha pulsado el botón de grabar nombre, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["grabarNombre"])) {
	
	if ($_REQUEST["modificarNombre"].trim() == "" ||$_REQUEST["modificarNombre"]==null|| !preg_match("/^[A-Za-záéíóúÁÉÍÓÚ\s]+$/", $_REQUEST["modificarNombre"])) {
		$errores[] = "El nombre no puede estar vacío o no ser alfabetico";
	}else{
		modificarNombre($conexion, $dni, $_REQUEST["modificarNombre"]);
		$_SESSION["amove"]=$_REQUEST["modificarNombre"].trim();
		header("Location: editarPerfilProfesorAdmin.php");
	}
} 

//Si se ha pulsado el botón de cancelar. se eliminará la sesión de modificar y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["cancelarNombre"])) {
	unset($_SESSION["modificarNombre"]);
	header("Location: editarPerfilProfesorAdmin.php");
} 

//Si se ha pulsado el botón de editar apellidos, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["editarApellidos"])) {
	$_SESSION["modificarApellidos"] = $dato["apellidos"];
	header("Location: editarPerfilProfesorAdmin.php");
}

//Si se ha pulsado el botón de grabar apellidos, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["grabarApellidos"])) {
	if ($_REQUEST["modificarApellidos"] == "" || !preg_match("/^[A-Za-záéíóúÁÉÍÓÚ\s]+$/",$_REQUEST["modificarApellidos"]) ) {
		$errores[] = "Los apellidos no puede estar vacío o no ser alfabeticos";
	}else{
		modificarApellidos($conexion, $dni, $_REQUEST["modificarApellidos"]);
		header("Location: editarPerfilProfesorAdmin.php");
	}
} 

//Si se ha pulsado el botón de cancelar. se eliminará la sesión de modificar y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["cancelarApellidos"])) {
	unset($_SESSION["modificarApellidos"]);
	header("Location: editarPerfilProfesorAdmin.php");
} 

//Si se ha pulsado el botón de editar fecha de nacimiento, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["editarFechaNacimiento"])) {
	$_SESSION["modificarFechaNacimiento"] = $dato["fechaNacimiento"];
	header("Location: editarPerfilProfesorAdmin.php");
}

//Si se ha pulsado el botón de grabar fecha de nacimiento, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["grabarFechaNacimiento"])) {
	if ( $_REQUEST["modificarFechaNacimiento"] == ""){
		$errores[] = "La fecha de nacimiento no puede estar vacía";
	}else if(!preg_match("/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/",$_REQUEST["modificarFechaNacimiento"])){
		$errores[] = "La fecha de nacimiento no tiene el formato adecuado".  $_REQUEST["modificarFechaNacimiento"]."";
	} else if (strtotime(formatearFecha( $_REQUEST["modificarFechaNacimiento"])) >= strtotime(date("Y-m-d"))) {
		$errores[] = "La fecha de nacimiento es incorrecta".  $_REQUEST["modificarFechaNacimiento"]."";
	} else if ( strtotime(date("Y-m-d")) - strtotime(formatearFecha( $_REQUEST["modificarFechaNacimiento"]))< 568024200) {
		$errores[] = "Debes ser mayor de 18 años ".  $_REQUEST["modificarFechaNacimiento"]."";
	}else{
		modificarFecha_Nacimiento($conexion, $dni, $_REQUEST["modificarFechaNacimiento"]);
		header("Location: editarPerfilProfesorAdmin.php");
	}
} 

//Si se ha pulsado el botón de cancelar. se eliminará la sesión de modificar y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["cancelarFechaNacimiento"])) {
	unset($_SESSION["modificarFechaNacimiento"]);
	header("Location: editarPerfilProfesorAdmin.php");
}

//Si se ha pulsado el botón de editar email, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["editarEmail"])) {
	$_SESSION["modificarEmail"] = $dato["email"];
	header("Location: editarPerfilProfesorAdmin.php");
}

//Si se ha pulsado el botón de grabar email, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["grabarEmail"])) {
	if ($_REQUEST["modificarEmail"] == "") {
		$errores[] = "El email no puede estar vacío";
	} else if (filter_var($_REQUEST["modificarEmail"], FILTER_VALIDATE_EMAIL) == false) {
		$errores[] = "El email es incorrecto: " .$_REQUEST["modificarEmail"] . "";
	}else{
		modificarEmail($conexion, $dni, $_REQUEST["modificarEmail"]);
		header("Location: editarPerfilProfesorAdmin.php");
	}
} 

//Si se ha pulsado el botón de cancelar. se eliminará la sesión de modificar y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["cancelarEmail"])) {
	unset($_SESSION["modificarEmail"]);
	header("Location: editarPerfilProfesorAdmin.php");
} 

//Si se ha pulsado el botón de editar despacho, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["editarDespacho"])) {
	$_SESSION["modificarDespacho"] = $dato["despacho"];
	header("Location: editarPerfilProfesorAdmin.php");
}

//Si se ha pulsado el botón de grabar despacho, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["grabarDespacho"])) {
	
	$_SESSION["amove"]=$_REQUEST["modificarDespacho"];
	//$oid_d = getOIDDespacho($conexion, $_REQUEST["modificarDespacho"]);

		modificarDespacho($conexion, $dni, $_REQUEST["modificarDespacho"]);
	

} 

//Si se ha pulsado el botón de cancelar, se eliminará la sesión de modificar y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["cancelarDespacho"])) {
	unset($_SESSION["modificarDespacho"]);
	header("Location: editarPerfilProfesorAdmin.php");

} 

//Si se ha pulsado el botón de editar departamento, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["editarDepartamento"])) {
	$_SESSION["modificarDepartamento"] = $dato["departamento"];
	header("Location: editarPerfilProfesorAdmin.php");
}

//Si se ha pulsado el botón de grabar departamento, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["grabarDepartamento"])) {
	if ($_REQUEST["departamento"] == "") {
		$errores[] = "El departamento no puede estar vacío";
	}else{
		modificarDepartamento($conexion, $dni, $_REQUEST["departamento"]);
		header("Location: editarPerfilProfesorAdmin.php");
	}
} 

//Si se ha pulsado el botón de cancelar. se eliminará la sesión de modificar y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["cancelarDepartamento"])) {
	unset($_SESSION["modificarDepartamento"]);
	header("Location: editarPerfilProfesorAdmin.php");
} 

//Si se ha pulsado el botón de editar categoría, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["editarCategoria"])) {
	$_SESSION["modificarCategoria"] = $dato["categoria"];
	header("Location: editarPerfilProfesorAdmin.php");
}

//Si se ha pulsado el botón de grabar categoría, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["grabarCategoria"])) {
	if( $_REQUEST["categoria"]!=""){
		modificarCategoria($conexion, $dni, $_REQUEST["categoria"]);
		header("Location: editarPerfilProfesorAdmin.php");
	}else{
		$errores[]="La categoria no puede estar vacía";
	}
} 

//Si se ha pulsado el botón de cancelar. se eliminará la sesión de modificar y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["cancelarCategoria"])) {
	unset($_SESSION["modificarCategoria"]);
	header("Location: editarPerfilProfesorAdmin.php");
} 

//Si se ha pulsado el botón de editar horario, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["editarHorario"])) {
	$_SESSION["modificarHorario"] = $_REQUEST["editarHorario"];
	header("Location: editarPerfilProfesorAdmin.php");
}

//Si se ha pulsado el botón de grabar horario, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["grabarHorario"])) {
	if($_REQUEST["modificarHorarioInicioTutorias"]=="" || $_REQUEST["modificarHorarioFinTutorias"]==""){
		$errores[] = "Ningun parámetro puede estar vacío.";
	}else if(!preg_match("/^(0[1-9]|1\d|2[0-3]):([0-5]\d)$/", $_REQUEST["modificarHorarioFinTutorias"]) || !preg_match("/^(0[1-9]|1\d|2[0-3]):([0-5]\d)$/", $_REQUEST["modificarHorarioInicioTutorias"]) ){
		$errores[] = "El formato no es correcto.";
	}else if(strtotime($_REQUEST["modificarHorarioInicioTutorias"]) >= strtotime($_REQUEST["modificarHorarioFinTutorias"])){
		$errores[] = "La hora de inicio no puede ser posterior o igual a la hora de fin";
	}else{
		modificarHorario($conexion, $_REQUEST["OID_H"], $_REQUEST["modificarHorarioInicioTutorias"], $_REQUEST["modificarHorarioFinTutorias"]);
		header("Location: editarPerfilProfesorAdmin.php");
	}
} 

//Si se ha pulsado el botón de cancelar. se eliminará la sesión de modificar y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["cancelarHorario"])) {
	unset($_SESSION["modificarHorario"]);
	header("Location: editarPerfilProfesorAdmin.php");
} 

//Si se ha pulsado el botón de editar día, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["editarDia"])) {
	$_SESSION["modificarDia"] = $_REQUEST["editarDia"];
	header("Location: editarPerfilProfesorAdmin.php");
}

//Si se ha pulsado el botón de grabar día, se meterá en sesión que se ha pulsado dicho botón y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["grabarDia"])) {
	if( $_REQUEST["modificarDia"]==""){
		$errores[]="El día no puede estar vacío";
	}else{
		modificarDiaTutoria($conexion, $_REQUEST["OID_H"], $_REQUEST["modificarDia"]);
		header("Location: editarPerfilProfesorAdmin.php");
	}
} 


//Si se ha pulsado el botón de cancelar. se eliminará la sesión de modificar y se redirigirá a la página de editarPerfilProfesorAdmin
if (isset($_REQUEST["cancelarDia"])) {
	unset($_SESSION["modificarDia"]);
	header("Location: editarPerfilProfesorAdmin.php");
} 

//En el caso de que haya errores, se redirige a la página de editarPerfilProfesorAdmin y se muestran los errores, en caso contrario se redirige a la página de editarPerfilProfesorAdmin
if (count($errores) > 0) {
	$_SESSION['errores'] = $errores;
	header('Location: editarPerfilProfesorAdmin.php');
} else {
	unset($_SESSION['errores']);
	header('Location: editarPerfilProfesorAdmin.php');
}

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);

?>
