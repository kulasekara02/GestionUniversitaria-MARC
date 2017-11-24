<?php
//Includes
require_once ('includes/funciones.php');

//Se recoge el oid_e
if(isset($_POST['oid_e'])){
	$oid_e = intval($_POST['oid_e']);
}

//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Se elimina un evento para $oid_e llamando a la función 'eliminarEvento'
$eliminar = eliminarEvento($conexion, $oid_e);

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);

//Se muestra un mensaje 
if ($eliminar) {
	echo "Evento eliminado";
} else {
	echo "Error al eliminar evento";
}
?>