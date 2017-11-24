<?php
//Inicio de sesiones
session_start();

//Includes
include_once ('includes/funciones.php');

//Se comprueba si no existe en sesión ningún DNI y en tal caso se redirige a la página de login, en caso contrario se mete la sesión del DNI en la variable $dniAlumno
if (!isset($_SESSION['DNI'])) {
	header('Location: login.php');
} else {
	$dniAlumno = $_SESSION['DNI'];
}


//Se comprueba que hemos llegado aquí por el formulario de matriculación y en tal caso, se recogen los datos en variables, en caso contrario se redirige a la página de pedirTutorias
if (isset($_REQUEST['dia'])) {
	$dia = $_REQUEST['dia'];
	$hora = $_REQUEST['hora'];
	$dniProf = $_REQUEST['DNI'];
	$fecha = $_REQUEST['fecha'];
} else {
	header('Location: pedirTutoria.php');
}

//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Se realiza la función 'pedirTutoria' y se guarda el valor booleano en $exito
$exito = pedirTutoria($conexion, $dniAlumno, $dniProf, $fecha, $hora);

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);

//Botón del menú que estará on
$menuBoton_on = 2;

?>
<!DOCTYPE HTML>
<html lang='es'>
	<head>
		<title>Pedir tutoría</title>
		<meta charset='utf-8' />
		<meta name='viewport' content='width=device-width, initial-scale=1.0' />
		<link rel='shortcut icon' type='image/x-icon' href='img/favicon.ico'>
		<link rel='stylesheet' type='text/css' href='css/general.css' />
		<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js'></script>
		<script type='text/javascript' src='js/funcionesJQuery.js'></script>
	</head>
	<body>
		<!--Cabecera-->
		<?php include_once ('includes/cabecera.php'); ?>

		<!--Menú-->
		<?php include_once ('includes/menu.php'); ?>

		<!--Contenido principal-->
		<main>
			<article>
				<div class='contenedor'>
					<section class='col-100 tablet-100 movil-100'>
						<?php 
						if($exito){ ?>
							<div class='exito alinearCentro reescalarImagen'>
								<span>Tutoría realizada con éxito.</span><br /><br />
								<img src='img/varios/confirmar.png' alt='Confirmado' />
							</div>
						<?php 
						} else{ ?>
							<div class='exito alinearCentro reescalarImagen'>
								<span>Ha ocurrido un error a la hora de registrar la tutoría.</span><br /><br />
								<img src='img/varios/denegar.png' alt='Denegado' />
							</div>
						<?php
						} ?>
					</section>
				</div>
			</article>
		</main>
		
		<!--Pie-->
		<?php include_once ('includes/pie.php'); ?>
	</body>
</html>