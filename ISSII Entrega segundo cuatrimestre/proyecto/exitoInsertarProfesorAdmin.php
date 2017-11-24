<?php
//Inicio de sesiones
session_start();

//Includes
require_once ('includes/funciones.php');

//Se comprueba que hemos llegado aquí por el formulario de matriculación y en tal caso se mete en la variable $usuario los datos del formulario y se elimina su sesión, en caso contrario, se redirige a la página de matriculación
if (isset($_SESSION['formulario'])) {
	$usuario = $_SESSION['formulario'];
	unset($_SESSION['formulario']);
} else {
	header('Location: insertarProfesorAdmin.php');
}

//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Se da de alta al alumno de la variable $usuario llamando a la función 'alta_profesor'
$altaProfesor = alta_profesor($conexion,$usuario);

//Se da de alta al usuario de la variable $usuario llamando a la función 'alta_usuarioProf'
$altaUsuarioProf = alta_usuarioProf($conexion, $usuario);

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);

//Botón del menú que estará on
$menuBoton_on = 5;
?>
<!DOCTYPE HTML>
<html lang='es'>
	<head>
		<title>Alta de profesor realizada con éxito</title>
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
						if($altaProfesor && $altaUsuarioProf){ ?>
							<div class='exito alinearCentro reescalarImagen'>
								<span>¡Enhorabuena! El proceso de introduccion de profesor se ha realizado correctamente.</span><br /><br />
								<img src='img/varios/confirmar.png' alt='Confirmado' />
							</div>
						<?php 
						} else{ ?>
							<div class='exito alinearCentro reescalarImagen'>
								<span>Ha ocurrido un error a la hora de insertar el profesor.</span><br /><br />
								<img src='img/varios/denegar.png' alt='Denegado' />
							</div>
						<?php
						} ?>
					</section>
				</div>
			</article>
		</main>
		<div class='clear'></div>

		<!--Pie-->
		<?php include_once ('includes/pie.php'); ?>
	</body>
</html>