<?php
//Inicio de sesiones
session_start();

//Includes
require_once ('includes/funciones.php');

//Se comprueba si no existe en sesión ningún DNI y en tal caso se redirige a la página de login, en caso contrario se mete la sesión del DNI en la variable $dni
if (!isset($_SESSION['DNI'])) {
	header('Location: login.php');
} else {
	$dni = $_SESSION['DNI'];
}

//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Se obtiene los datos del evento para $dni llamando a la función 'getEventos'
$eventos = getEventos($conexion, $dni);

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);

//Botón del menú que estará on
$menuBoton_on = 3;
?>
<!DOCTYPE HTML>
<html lang='es'>
	<head>
		<title>Calendario</title>
		<meta charset='utf-8' />
		<meta name='viewport' content='width=device-width, initial-scale=1.0' />
		<link rel='shortcut icon' type='image/x-icon' href='img/favicon.ico'>
		<link rel='stylesheet' type='text/css' href='css/general.css' />
		<link rel='stylesheet' href='http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css' />
		<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js'></script>
		<script src='http://code.jquery.com/ui/1.10.1/jquery-ui.js'></script>
		<script type='text/javascript' src='js/funcionesJQuery.js'></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.7.0/moment.min.js" type="text/javascript"></script>
		<script>
			$(document).ready(function() {
				calendario();
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
				<div class='contenedor paddingsEspacios calendario'>
					<section class='col-100 tablet-100 movil-100'>
						<h1 class='alinearCentro titulillo'>Calendario</h1>
					</section>
					<br /><br />
					<div class='col-100 tablet-col-100 movil-col-100 alinearCentro'>
						<div class='resultadoEv'></div>
						<div class='conjunto'>
							<div id='datepicker'></div>
							<div id='popup' title='Nuevo evento'>
								<form class='formEvento' method='POST'>
									<span>Fecha:&nbsp;</span>
									<input type='text' id='fecha' name='fechaEvento'>
									<br />
									<span>Evento:</span>
									<input type='text' id='evento' name='evento'>
									<!-- <script type='text/javascript'>
										var fechasJS = <?php echo json_encode($fechas); ?>
									</script> -->
									<input type='hidden' id='fechas' name='fechas'>
									<input type='hidden' id='dni' name='dni' value='<?php echo $dni;?>'><br /><br />
									<input class='addEvento' type='button' value='Añadir evento'>
								</form>
							</div>
						</div>		
					</div>
					<div class='col-100 tablet-col-100 movil-col-100 alinearCentro'>
						<div class='conjunto'>
							<div class='eventos'>
								<fieldset>
									<legend class='misEvs'>Mis eventos</legend><br />
									<div class ='misEventos'></div>
								</fieldset>
								<div id="eventosParaJS"><?php 
									$fechas = array();
									foreach($eventos as $evento){
										// array_push($fechas, $evento['FECHA']);
										echo "<input type='hidden' data-Ev='0' value='".$evento['FECHA'] ."'>";
										echo "<input type='hidden' data-Ev='1' value='".$evento['NOMBRE'] ."'>";
									}
									?>
							</div>
							</div>
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