<?php
     /* Función para crear una conexión con la base de datos Oracle
 ========================================================================== */
function crearConexionBD() {
	$host = "oci:dbname=localhost/XE;charset=UTF8";
	$usuario = "ProyectoIISSI";
	$password = "1234";
	try {
		$conexion = new PDO($host, $usuario, $password, array(PDO::ATTR_PERSISTENT => true));
		$conexion -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		return $conexion;
	} catch(PDOException $e) {
		$_SESSION['excepcion'] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para cerrar la conexión con la base de datos Oracle.
 ========================================================================== */
function cerrarConexionBD($conexion) {
	$conexion = null;
}
?>