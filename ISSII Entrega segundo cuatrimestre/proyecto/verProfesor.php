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

//Se comprueba si no existe la variable de request DNI del formulario para saber si no viene de este y en tal caso se redirige a la página de buscarProfesorPerfil, en caso contrario, se guarda en la variable $DNIProf
if (!isset($_REQUEST['DNI'])) {
	header('Location: buscarProfesorPerfil.php');
} else{
	$DNIProf = $_REQUEST['DNI'];
}

//Se comprueba si existe la variable de sesión DNI_PROF y en tal caso se elimina dicha sesión
if (isset($_SESSION['DNI_PROF'])) {
	unset($_SESSION['DNI_PROF']);
}

//Se comprueba si existe la variable de sesión NOMBRE_PROF y en tal caso se elimina dicha sesión
if (isset($_SESSION['NOMBRE_PROF'])) {
	unset($_SESSION['NOMBRE_PROF']);
}

//Se mete en las variables de sesión los datos del profesor
$_SESSION['DNI_PROF'] = $DNIProf;
$_SESSION['NOMBRE_PROF'] = $_REQUEST['nombreCompleto'];


//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Se obtiene los datos del profesor para $DNIProf llamando a la función 'getInfoProfesor'
$datosProfesor = getInfoProfesor($conexion, $DNIProf);

//Se obtiene los datos del departamento para $datosProfesor llamando a la función 'nombreDepartamento'
$nombreDep = nombreDepartamento($conexion, $datosProfesor['OID_DEP']);

//Se obtiene los datos del despacho para $datosProfesor llamando a la función 'nombreDespacho'
$nombreDesp = nombreDespacho($conexion, $datosProfesor['OID_D']);

//Se obtiene los datos de las asignaturas para $DNIProf llamando a la función 'getAsignaturasProfesor'
$asignaturasProf = getAsignaturasProfesor($conexion, $DNIProf);

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);

//Botón del menú que estará on
$menuBoton_on = 2;

 ?>
<!DOCTYPE HTML>
<html lang='es'>
	<head>
		<title>Información del profesor</title>
		<meta charset='utf-8' />
		<meta name='viewport' content='width=device-width, initial-scale=1.0' />
		<link rel='shortcut icon' type='image/x-icon' href='img/favicon.ico'>
		<link rel='stylesheet' type='text/css' href='css/general.css' />
		<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js'></script>
		<script type='text/javascript' src='js/funcionesJQuery.js'></script>
		<script>
			$(document).ready(function() {
				desplegableAsignaturas();
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
				<div class='contenedor paddingsEspacios'>
					<br /><br /><br />
					<section class='col-100 tablet-100 movil-100'>
	  					<div class='datosProfesor'>
							<span class='nombreProf'><?php echo $datosProfesor['NOMBRE'].' '.$datosProfesor['APELLIDOS']; ?></span><br />
							<span class='emailProf'><?php echo $datosProfesor['EMAIL']; ?></span><a class='botonTut' href='pedirTutoria.php'>Pedir Tutoría</a><br /><br />
							<span class='depProf'><?php echo $nombreDep['NOMBRE']; ?></span><a class='botonVerTut' href='verTutoriasAlumno.php?profesor=<?php echo $DNIProf;?>'>Ver tutorías</a><br />
							<span class='despProf'>Despacho: <?php echo $nombreDesp['NOMBRE']; ?></span><br />
							<div class='mostrarAsigs'>Asignaturas <img src='img/varios/downArrow.png' class='downArrow'></div>
							<div class='asignaturasProf'>
								<span class='asigsProf'>
									<?php
									foreach($asignaturasProf as $asig){
										echo $asig['NOMBRE'].'<br />';
									} ?>
								</span>
							</div>
						</div>
		  			</section>
		  		</div>
		  	</article>
			<div class='clear'></div>
		</main>
		<div class='clear'></div>

		<!--Pie-->
		<?php include_once ('includes/pie.php'); ?>
	</body>
</html>
