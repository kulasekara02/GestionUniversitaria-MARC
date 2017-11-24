<?php
//Inicio de sesiones
session_start();

//Includes
require_once ('includes/funciones.php');

//Si existe la sesión de exception, se mete en la variable $excepcion la sesión de excepción y se elimina, en caso contrario, se redirige a la página index.php
if (isset($_SESSION["excepcion"])) {
	$excepcion = $_SESSION["excepcion"];
	unset($_SESSION["excepcion"]);
} else {
	header("Location: index.php");
}

//Si existe la sesión de destino, se mete en la variable $destino y se elimina la sesión, en caso contrario, se mete en la variable $destino index.php
if (isset($_SESSION["destino"])) {
	$destino = $_SESSION["destino"];
	unset($_SESSION["destino"]);
} else {
	$destino = "index.php";
}

//Botón del menú que estará on
$menuBoton_on = 0;
?>
<!DOCTYPE HTML>
<html lang='es'>
	<head>
		<title>¡Se ha producido un problema!</title>
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
		<script>
		$(document).ready(function() {
			desplegableMenu();
		});
		</script>
		
		<menu class="col-100 tablet-col-100 movil-col-100 noPadding">
			<a href='#' id='desplegableMenu' class='esconderEnEscritorio' >MENÚ <img src='img/varios/icono_menu.png' alt='Menú' /></a>
			<ul id="menuCabecera">
				<li class="boton_off">
					<a href="#">Excepción</a>			
				</li>
			</ul>
		</menu>
		<div class="clear"></div>

		<!--Contenido principal-->
		<main>
			<article>
				<div class='contenedor'>
					<section class='col-100 tablet-100 movil-100'>
						<div class='exito alinearCentro reescalarImagen'>
							<span>¡Ups!</span><br />
							<img width="20%" src='img/varios/denegar.png' alt='Denegado' /><br />
							<span>Ocurrió un problema durante el procesado de los datos.</span><br /><br />
							<span>Información relativa al problema: <?php echo $excepcion; ?></span><br /><br />
							<span>Pulse <a href="<?php echo $destino ?>">aquí</a> para volver a la página principal.
						</div>
					</section>
				</div>
			</article>
		</main>		
		<div class='clear'></div>

		<!--Pie-->
		<footer>
			<div class="contenedor">
				<div class="col-40 tablet-col-100 movil-col-100 alinearCentro">
					<img src="img/varios/logo.png" class="logoPie" />
					<br />
				</div>
				<div class="col-60 tablet-col-100 movil-col-100">
					<ul id="menuPie">
						<li class="boton_off">
							<a href="#">Excepción</a>			
						</li>
					</ul>
				</div>
			</div>
		</footer>
		<div class="clear"></div>
	</body>
</html>