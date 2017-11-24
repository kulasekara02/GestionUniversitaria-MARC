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

//Se comprueba si existe en sesión algún dato y en tal caso, se mete en la variable $dato y se elimina su sesión
if (isset($_SESSION["dato"])) {
	$dato = $_SESSION["dato"];
	unset($_SESSION["dato"]);
}


//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Se obtienen los datos del alumno para $dni llamando a la función 'getInfoAlumno'
$datos = getInfoAlumno($conexion, $dni);

//Se obtienen los datos del grupo del alumno para $dni llamando a la función 'getGrupoAlumno'
$grupo = getGrupoAlumno($conexion, $dni);

//Se obtiene el grado del alumno para $dni llamando a la función 'getGradoAlumno'
$grado = getGradoAlumno($conexion, $dni);

//Se obtiene el nombre del grado del alumno para $grado llamando a la función 'getNombreGrado'
$nombreGrado = getNombreGrado($conexion, $grado);

//Se obtiene el curso del alumno para $dni llamando a la función 'getCursoAlumno'
$curso = getCursoAlumno($conexion, $dni);

//Se obtiene las asignaturas del alumno para $dni llamando a la función 'getCodigoAsignaturas'
$codAsignaturas = getCodigoAsignaturas($conexion, $dni);

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);
			
//Botón del menú que estará on
$menuBoton_on = 5;
?>

<!DOCTYPE HTML>
<html lang='es'>
	<head>
		<title>Perfil de alumno</title>
		<meta charset='utf-8' />
		<meta name='viewport' content='width=device-width, initial-scale=1.0' />
		<link rel='shortcut icon' type='image/x-icon' href='img/favicon.ico'>
		<link rel='stylesheet' type='text/css' href='css/general.css' />
		<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js'></script>
		<script type='text/javascript' src='js/funcionesJQuery.js'></script>
		<script>
			$(document).ready(function() {
				mostrarOcultarAsignaturas();
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
				<div class='contenedor paddingsEspacios verAlumno'>
					<section class='col-100 tablet-100 movil-100'>
						<h1 class='alinearCentro titulillo'><b>Perfil</b></h1>
					</section>
					<br /><br /><br />
					<div class='col-100 tablet-col-100 movil-col-100'>
						<div class="datosAlumno">
							<h1><b>Datos personales</b></h1>
							<hr></hr><br>
							<p><b>DNI:</b> <?php echo $dni; ?> </p>
							<p><b>Nombre:</b> <?php echo $datos["NOMBRE"]; ?></p>
							<p><b>Apellidos:</b> <?php echo $datos["APELLIDOS"]; ?></p>
							<p><b>Sexo:</b> <?php echo $datos["SEXO"]; ?></p>
							<p><b>Telefono:</b> <?php echo $datos["TELEFONO"]; ?></p>
							<p><b>Provincia:</b> <?php echo $datos["PROVINCIA"]; ?></p>
							<p><b>Codigo postal:</b> <?php echo $datos["CODIGO_POSTAL"]; ?></p>
							<p><b>Forma de acceso:</b> <?php echo $datos["FORMA_ACCESO"]; ?></p>
							<p><b>Fecha de Nacimiento:</b> <?php echo $datos["FECHA_NACIMIENTO"]; ?></p>
							<p><b>Email:</b> <?php echo $datos["EMAIL"]; ?></p>
							
							<br />
							<h1><b>Datos académicos</b></h1>
							<hr></hr><br>
							<p><b>Modalidad:</b> <?php echo $datos["MODALIDAD"]; ?></p>
							<p><b>Grupo:</b> <?php echo $grupo["OID_GRUP"]; ?></p>
							<p><b>Estado beca:</b> <?php echo $datos["ESTADO_BECA"]; ?></p>
							<p><b>Curso:</b> <?php echo $curso['CURSO']; ?></p>
							<div class='mostrarAsigs2'><p><b>Asignaturas </b><img src='img/varios/downArrow.png' id="mostrarInfoAsignaturas" class='downArrow'></div>
							<br />
							<div class="infoAsignaturas" style="display: none;">
								<ul>
									<?php 
									forEach($codAsignaturas as $codigo_asig){ 
										$conexion = crearConexionBD();
										$asignatura = getAsignaturaAlumno($conexion, $codigo_asig['CODIGO_ASIG']);
										cerrarConexionBD($conexion); ?>
										<li>
											<?php echo $asignatura['NOMBRE']; ?>
										</li>
									<?php 
									} ?>
								</ul></p>
								<br />	
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