<?php
//Inicio de sesiones
session_start();

//Includes
include_once ('includes/funciones.php');

//Se comprueba si no existe en sesión ningún DNI y en tal caso se redirige a la página de login, en caso contrario se mete la sesión del DNI en la variable $dni
if (!isset($_SESSION['DNI'])) {
	header('Location: login.php');
} else {
	$dni = $_SESSION['DNI'];
}

//Se comprueba si no existe en sesión el DNI del profesor y en tal caso se redirige a la página de búsquedaProfesor, en caso contrario se mete dicha sesión del dni y del nombre completo en la variable $DNIProf y $nombreCompleto respectivamente, y se elimina la sesión
if (!isset($_SESSION["DNI_PROF"])) {
	header('Location: buscarProfesorPerfil.php');
}
else{
	$DNIProf = $_SESSION["DNI_PROF"];
	$nombreCompleto = $_SESSION["NOMBRE_PROF"];
	unset($_SESSION["DNI_PROF"]);
}

//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Se obtiene los datos del horario del profesor para $DNIProf llamando a la función 'getInfoHorarioProfesores'
$diasTutoria = getDiasHorarioProfesores($conexion, $DNIProf);

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);

//Botón del menú que estará on
$menuBoton_on = 2;

?>
<!DOCTYPE HTML>
<html lang='es'>
	<head>
		<title>Tutorías solicitadas</title>
		<meta charset='utf-8' />
		<meta name='viewport' content='width=device-width, initial-scale=1.0' />
		<link rel='shortcut icon' type='image/x-icon' href='img/favicon.ico'>
		<link rel='stylesheet' type='text/css' href='css/general.css' />
		<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js'></script>
		<script type='text/javascript' src='js/funcionesJQuery.js'></script>
		<script>
			$(document).ready(function() {
				disponibilidadTutorias();
			});
		</script>
	</head>
	<body>
		<!--Cabecera-->
		<?php include_once ('includes/cabecera.php'); ?>

		<!--Menú-->
		<?php include_once ('includes/menu.php'); ?>
		
		<!--Contenido principal-->
		<main>
			<article>
				<div class='contenedor peticionTutoria'>
					<br /><br /><br />
					<section class='col-100 tablet-100 movil-100'>
						<h1 class='alinearCentro titulillo'>Pedir tutoria</h1>
					</section>
					<div class='col-100 tablet-100 movil-100'>
  						<div class='formPedirTutoria'>
							<p>Complete el siguiente formulario para pedir tutoría a <br /><b><?php echo $nombreCompleto; ?></b>:</p><br />
							<form id='formulario' method='POST' action='exitoPedirTutoria.php'>
								<label for='dia'><b>Día:</b></label>
									<select id='dia' name='dia'>
		  	   							<option value='Seleccionar'>Seleccionar</option>
								  		<?php foreach($diasTutoria as $dia) {?>
								  			<option value='<?php echo $dia['DIA']?>'><?php echo $dia['DIA']; ?></option>
								  	    <?php } ?>
									</select>
								<br class="esconderEnEscritorio mostrarEnTablet mostrarEnMovil" />	
								<label for='dia'><b>Fecha:</b></label>
								<select id='fechas' name='fecha'>
									<option value='Seleccionar'>Seleccionar</option>
								</select>
								<br class="esconderEnEscritorio  mostrarEnTablet mostrarEnMovil" />	
								<label for='dia'><b>Hora:</b></label>
								<select id='horas' name='hora'>
									<option value='Seleccionar'>Seleccionar</option>
								</select><br />
								<input type='hidden' id='DNI' name='DNI' value='<?php echo $DNIProf; ?>'>	
								<input class='pedirTutoria' type='submit' value='Enviar'>
							</form>
  						</div>
  					</div>
  				</div>
			</article>
			<div class='clear'></div>
		</main>
		<div class='clear'></div>

		<!--Pie-->
		<?php include_once ('includes/pie.php'); ?>
	</body>
</html>