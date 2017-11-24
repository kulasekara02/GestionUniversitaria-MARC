<?php
//Includes
include_once ('includes/funciones.php');

//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Se comprueba que exista un valor venido del formulario y en tal caso, se obtiene las horas llamando a la función "getHorasTutoriaDisponibles", en caso contrario se rellena un mensaje que indica que no hay horas disponibles
if(isset($_POST['valor'])){
	$dia = $_POST['valor'];
	$dniProf = $_POST['dniProf'];
	$horas = getHorasTutoriaDisponibles($conexion, $dniProf, $dia);
}
else{
	$mensajeHoras = '<option>No hay horas disponibles</option>';
}

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);

//Se muestra un listado de todas las horas disponibles
for ($i = 0; $i < count($horas); $i++) {
	$mensajeHoras .= '<option value="' . date('H:i', $horas[$i]) . '">' . date('H:i', $horas[$i]) . '</option>';
}

//Se imprime el lista de horas o el mensaje de que no hay horas disponibles en caso de no haber
echo $mensajeHoras;

?>