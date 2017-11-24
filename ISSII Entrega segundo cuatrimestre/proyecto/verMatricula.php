<?php
//Inicio de sesiones
session_start();

//Includes
require_once ('includes/funciones.php');

//Se comprueba si existe la variable del formulario y en tal caso se meten los datos de este en la variable $usuario, en caso contrario, se redirige a la página de matriculación
if (isset($_REQUEST['dni'])) {
	$usuario['dni'] = $_REQUEST['dni'];
	$usuario['sexo'] = $_REQUEST['sexo'];
	$usuario['nombre'] = $_REQUEST['nombre'];
	$usuario['apellidos'] = $_REQUEST['apellidos'];
	$usuario['email'] = $_REQUEST['email'];
	$usuario['telefono'] = $_REQUEST['telefono'];
	$usuario['fecha'] = $_REQUEST['fecha'];
	$usuario['provincia'] = $_REQUEST['provincia'];
	$usuario['direccion'] = $_REQUEST['direccion'];
	$usuario['cpostal'] = $_REQUEST['cpostal'];
	$usuario['curso'] = $_REQUEST['curso'];
	$usuario['acceso'] = $_REQUEST['acceso'];
	$usuario['modalidad'] = $_REQUEST['modalidad'];
	$usuario['becas'] = $_REQUEST['becas'];
	$usuario['asignaturas'] = $_REQUEST['asignaturas'];
} else{
	header('Location: matriculacion.php');
}

//Botón del menú que estará on
$menuBoton_on = 3;
?>

<!DOCTYPE HTML>
<html lang='es'>
	<head>
		<title>Matrícula</title>
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
		<main class='verMatricula paddingsEspacios'>
			<article>
				<div class='contenedor alinearCentro'>
					<section class='col-100 tablet-100 movil-100'>
						<h1 class='titulillo alinearCentro'>Matrícula</h1>
					</section>
					<br /><br /><br />
	   				<div class='col-100 tablet-col-100 movil-col-100'>
						<table class='datosPersonales'>
						  	<tr>
						  		<td class='titulo' colspan='4'>Datos personales</td>
						  	</tr>
						  	<tr>
								<th>DNI/NIF</th>
									<td><?php echo $usuario['dni']; ?></td>
								<th>Sexo</th>
									<td><?php echo $usuario['sexo']; ?></td>
							</tr>
							<tr>
								<th>Nombre</th>
									<td><?php echo $usuario['nombre']; ?></td>
								<th>Teléfono</th>
									<td><?php echo $usuario['telefono']; ?></td>
							</tr>
							<tr>
								<th>Apellidos</th>
									<td><?php echo $usuario['apellidos']; ?></td>
								<th>Código postal</th>
									<td><?php echo $usuario['cpostal']; ?></td>
							</tr>
							<tr>
							    <th>Correo electrónico</th>
							    	<td><?php echo $usuario['email']; ?></td>
							    <th>Provincia</th>
							    	<td><?php echo $usuario['provincia']; ?></td>
							</tr>
							<tr>
								<th>Fecha de nacimiento</th>
									<td><?php echo $usuario['fecha']; ?></td>
								<th>Dirección</th>
									<td><?php echo $usuario['direccion']; ?></td>
							</tr>
						</table>
					</div>
	   				<div class='col-100 tablet-col-100 movil-col-100'>
						<table class='datosPersonales'>
  							<tr>
  								<td class='titulo' colspan='4'>Datos académicos</td>
  							</tr>
  							<tr>
    							<th>Curso</th>
    								<td><?php echo $usuario['curso']; ?></td>
							    <th>Forma de acceso</th>
							    	<td><?php echo getFormaAcceso($usuario['acceso']); ?></td>
  							</tr>
							<tr>
								<th>Modalidad</th>
									<td><?php echo $usuario['modalidad']; ?></td>
								<th>Becas y subvenciones</th>
									<td><?php echo $usuario['becas']; ?></td>
							</tr>
							<tr>
								<th colspan="4">Asignaturas</th>
							</tr>
							<?php 
							$conexion = crearConexionBD();
							if(isset($usuario['asignaturas'])){
								foreach($usuario['asignaturas'] as $asig){ 
									$asignatura = getAsignaturaAlumno($conexion, $asig);
									?>
									<tr>
										<td colspan="4"><?php echo $asignatura['NOMBRE']; ?></td> 
									</tr>
								<?php
								}
							} 
							cerrarConexionBD($conexion); ?>
						</table>
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