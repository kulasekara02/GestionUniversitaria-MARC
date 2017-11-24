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

//Se obtiene los datos de si es administrador para $dni llamando a la función 'esAdministrador'
$admin = esAdministrador($conexion, $dni);

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);

//Botón del menú que estará on
$menuBoton_on = 1;

?>
<!DOCTYPE HTML>
<html lang='es'>
	<head>
		<title>Inicio</title>
		<meta charset='utf-8' />
		<meta name='viewport' content='width=device-width, initial-scale=1.0' />
		<link rel='shortcut icon' type='image/x-icon' href='img/favicon.ico'>
		<link rel='stylesheet' type='text/css' href='css/general.css' />
		<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js'></script>
		<script type='text/javascript' src='js/funcionesJQuery.js'></script>
		<script>
			$(document).ready(function() {
				moverBannerDerecha();
				moverBannerIzquierda();
				reproducirBanner();
			});
		</script>
	</head>
	<body>
		<!--Cabecera-->
		<?php include_once ('includes/cabecera.php'); ?>

		<!--Menú-->
		<?php include_once ('includes/menu.php'); ?>

		<!--Slider-->
		<div class='contenedorSlider'>
			<div id='slider'>
				<?php crearSlider(); ?>
			</div>
			<span id='botonAnterior' class='botonAnterior'> < </span>
			<span id='botonPosterior' class='botonPosterior'> > </span>
		</div>
		<div class='clear'></div>

		<!--Contenido principal-->
		<main>
			<article>
				<div class='contenedor paddingsEspacios descripcionInicio'>
					<section class='col-100 tablet-100 movil-100'>
						<h1 class='titulillo alinearCentro'>¿Qué es M.A.R.C?</h1>
					</section>
					<br /><br /><br />
					<div class='col-50 tablet-col-100 movil-col-100'>
						<p>M.A.R.C es una aplicación dinámica creada con el objetivo de facilitar la gestión de tutorías a los usuarios de la Universidad. Gracias a M.A.R.C, alumnos y profesores dispondrán de una amplia variedad de funciones mediante las cuales podrán concertar tutorías de forma rápida y sencilla.</p><br />
						<p>Los alumnos podrán visualizar fácilmente el horario de tutorías de todos los profesores de la Universidad, pudiendo consultar su disponibilidad y escogiendo el momento que mejor les convenga.</p>
					</div>
					<div class='esconderEnEscritorio mostrarEnTablet mostrarEnMovil'>
						<div class='clear'></div>
						<br />
					</div>
					
					<div class='col-50 tablet-col-100 movil-col-100'>
						<p>También tendrán la posibilidad de cancelar las citas concertadas o de modificarlas. Los profesores, por su parte, podrán aceptar o denegar las peticiones recibidas, así como modificar su horario de tutorías para mantenerlo siempre actualizado.</p>
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