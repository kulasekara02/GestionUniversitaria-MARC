<?php
//Includes
include_once ('includes/funciones.php');

//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Se comprueba que exista un valor venido del formulario y en tal caso, se obtiene las fechas llamando a la función "getFechasTutorias", en caso contrario se rellena un mensaje que indica que no hay fechas disponibles
if(isset($_POST['valor'])){
	$dia = $_POST['valor'];
	$fechas = getFechasTutorias($dia);
}
else{
	$mensajeFechas = '<option>No hay fechas disponibles</option>';
}

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);

//Se muestra un listado de todas las horas disponibles
for ($i = 0; $i < count($fechas); $i++) {
	$mensajeFechas .= '<option value="' . $fechas[$i] . '">' . $fechas[$i] . '</option>';
}

//Se imprime el lista de fechas o el mensaje de que no hay fechas disponibles en caso de no haber
echo $mensajeFechas;

?>