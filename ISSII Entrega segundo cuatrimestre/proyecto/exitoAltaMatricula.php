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
	header('Location: matriculacion.php');
}

//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Se da de alta al alumno de la variable $usuario llamando a la función 'alta_alumno'
$altaAlumno = alta_alumno($conexion, $usuario);

//Se da de alta al usuario de la variable $usuario llamando a la función 'alta_usuario'
$altaUsuario = alta_usuario($conexion, $usuario);

//Se da de alta al usuario en la matricula de la variable $usuario llamando a la función 'alta_matricula'
$altaMatriculaUsuario = alta_matricula($conexion, $usuario);

//Se obtienen las mátriculas de un usuario
$matriculas = getMatriculas($conexion, $usuario);

//Se insertan las asignaturas a la matrícula
foreach ($matriculas as $matric) {
	foreach ($usuario["asignaturas"] as $asig) {
		$altaAsignaturaMatricula = alta_asignaturasMatricula($conexion, $matric["CODIGO_MATRIC"], $asig);
	}
}

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);

//Botón del menú que estará on
$menuBoton_on = 3;
?>
<!DOCTYPE HTML>
<html lang='es'>
	<head>
		<title>Alta de alumno realizada con éxito</title>
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
						if($altaAlumno && $altaUsuario && $altaMatriculaUsuario && $altaAsignaturaMatricula){ ?>
							<div class='exito alinearCentro reescalarImagen'>
								<span>¡Enhorabuena! Su proceso de matriculación se ha completado con éxito.</span><br /><br />
								<img src='img/varios/confirmar.png' alt='Confirmado' />
							</div>
						<?php 
						} else{ ?>
							<div class='exito alinearCentro reescalarImagen'>
								<span>Ha ocurrido un error a la hora de matricularse.</span><br /><br />
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