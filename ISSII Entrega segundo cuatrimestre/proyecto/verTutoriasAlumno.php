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

//Se comprueba si existe en sesión alguna paginacióna anterior y en tal caso se mete en la variable $paginacion
if (isset($_SESSION['paginacion'])) {
	$paginacion = $_SESSION['paginacion'];
}

//Se comprueba si existe en la url 'PAG_NUM' y en tal caso se mete en la variable $paginaSeleccionada su valor numérico. En caso contrario, se comprueba si existe la variable $paginacion y en tal caso se mete en la variable $paginaSeleccionada el valor numérico de 'PAG_NUM', en caso contrario, se mete un 1
$paginaSeleccionada = isset($_GET['PAG_NUM']) ? (int)$_GET['PAG_NUM'] : (isset($paginacion) ? (int)$paginacion['PAG_NUM'] : 1);

//Se comprueba si existe en la url 'PAG_TAM' y en tal caso se mete en la variable $paginaTamanio su valor numérico. En caso contrario, se comprueba si existe la variable $paginacion y en tal caso se mete en la variable $paginaTamanio el valor numérico de 'PAG_TAM', en caso contrario, se mete un 5
$paginaTamanio = isset($_GET['PAG_TAM']) ? (int)$_GET['PAG_TAM'] : (isset($paginacion) ? (int)$paginacion['PAG_TAM'] : 5);

//Se realiza una comprobación para evitar que se fuerce por url los valores numéricos a 0 o menos
if ($paginaSeleccionada < 1) {
	$paginaSeleccionada = 1;
}
if ($paginaTamanio < 1) {
	$paginaTamanio = 5;
}

//Se elimina la variable de sesión de paginacióna
unset($_SESSION['paginacion']);

//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Se mete en la variable $tutorias la consulta que se quiere realizar
if(isset($_GET['profesor'])){
$tutorias = "SELECT OID_T, Fecha, Hora_Comienzo, Duracion, Estado, DNI_Prof FROM Tutorias WHERE DNI_Alum = '".$dni."' AND DNI_Prof = '".$_GET['profesor']."' ORDER BY Fecha ";
}else{
$tutorias = "SELECT OID_T, Fecha, Hora_Comienzo, Duracion, Estado, DNI_Prof FROM Tutorias WHERE DNI_Alum = '".$dni."' ORDER BY Fecha ";
}
//Se obtiene el total de tutorias del alumno llamando a la función 'totalConsulta'
$totalRegistros = totalConsulta($conexion, $tutorias);

//Se comprueba que el tamaño de página, página seleccionada y total de registros son conformes.
$totalPaginas = (int)($totalRegistros / $paginaTamanio);
if ($totalRegistros % $paginaTamanio > 0) {
	$totalPaginas++;
}

if ($paginaSeleccionada > $totalPaginas) {
	$paginaSeleccionada = $totalPaginas;
}

//Se generan los valores de sesión de paginación para volver a ella después de una operación
$paginacion['PAG_NUM'] = $paginaSeleccionada;
$paginacion['PAG_TAM'] = $paginaTamanio;
$_SESSION['paginacion'] = $paginacion;

//Se obtienen todas las tutorías del alumno paginadas
$tutoriasPaginada = consultaPaginada($conexion, $tutorias, $paginaSeleccionada, $paginaTamanio);

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);

//Botón del menú que estará on
$menuBoton_on = 4;

?>
<!DOCTYPE HTML>
<html lang='es'>
	<head>
		<title>Mis tutorías</title>
		<meta charset='utf-8' />
		<meta name='viewport' content='width=device-width, initial-scale=1.0' />
		<link rel='shortcut icon' type='image/x-icon' href='img/favicon.ico'>
		<link rel='stylesheet' type='text/css' href='css/general.css' />
		<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js'></script>
		<script type='text/javascript' src='js/funcionesJQuery.js'></script>
		<script>
			$(document).ready(function() {
				mostrarOcultarPaginacion();
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
			<div class='clear'></div>
			<article>
				<div class='contenedor alinearCentro tutorias'>
					<div class='col-100 tablet-col-100 movil-col-100'>
						<h1 class='EncabezadoTutorias'>Tutorías</h1>
					</div>
					<div class='col-100 tablet-col-100 movil-col-100'>
						<table class='datosTutoria'>
    						<tr class='etiquetasTutoria'>
								<th>Fecha</th>
								<th>Hora de comienzo</th>
								<th>Duración</th>
								<th>Profesor</th>
								<th>Estado</th>
							</tr>
			    			<?php 
			    			$i = 0;
			    			foreach($tutoriasPaginada as $tutoria){
								$conexion = crearConexionBD();
								$nombre = nombreProfesor($tutoria['DNI_PROF'], $conexion);
								cerrarConexionBD($conexion);
								if ($tutoria['ESTADO'] == 'Aceptada') {
									$estado = 'aceptada';
								} else if ($tutoria['ESTADO'] == 'Rechazada') {
									$estado = 'rechazada';
								} else {
									$estado = 'espera';
								}
								if ($i % 2 == 0) {
									$fila = 'par';
								} else {
									$fila = 'impar';
								}
								$i++; ?>
					    		<tr class='<?php echo $fila; ?>' >
								<td><?php echo $tutoria['FECHA']; ?></td>
								<td><?php echo $tutoria['HORA_COMIENZO']; ?></td>
								<td><?php echo $tutoria['DURACION']; ?></td>
								<td><?php echo $nombre['NOMBRE'].' '.$nombre['APELLIDOS']; ?></td>
								<td class='<?php echo $estado; ?>' > <?php echo $tutoria['ESTADO'] ?></td>
								</tr>
			    			<?php
							} ?>
			    		</table>
					</div>
				</div>
			</article>
			<div class='clear'></div>
			<nav class='paginacion'>
				<div class='contenedor alinearCentro enlacesPaginacion'>
					<section class='col-100 tablet-100 movil-100'>
						<?php
						for($pagina = 1; $pagina <= $totalPaginas; $pagina++) 
							if ( $pagina == $paginaSeleccionada) { 	?>
								<span class='current'><?php echo $pagina; ?></span>
							<?php 
							} else { ?>			
								<a class='enlacePaginacion' href='verTutoriasAlumno.php?PAG_NUM=<?php echo $pagina; ?>&PAG_TAM=<?php echo $paginaTamanio; ?>'><?php echo $pagina; ?></a>
							<?php 
							} ?>
					</section>				
				</div>
			</nav>
			<div class='contenedor alinearCentro'>
				<section class='col-100 tablet-100 movil-100'>
					<button class='cambiarNumPag' id='cambiarNumPag'>Cambiar número de páginas</button>
		   			<form class='cambioPagina' method='GET' action='verTutoriasAlumno.php'>
						<input id='PAG_NUM' name='PAG_NUM' type='hidden' value='<?php echo $paginaSeleccionada; ?>' />
						<span>Mostrando <input id='PAG_TAM' name='PAG_TAM' type='number' min='1' max='<?php echo $totalRegistros; ?>' value='<?php echo $paginaTamanio; ?>' autofocus /> entradas de <?php echo $totalRegistros; ?></span>
						<input class='botonCambio' type='submit' value='Cambiar'>
					</form>	
				</section>				
			</div>			
		</main>
		<div class='clear'></div>
		<br /><br />

		<!--Pie-->
		<?php include_once ('includes/pie.php'); ?>
	</body>
</html>