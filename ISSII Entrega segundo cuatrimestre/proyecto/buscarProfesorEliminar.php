<?php
//Inicio de sesiones
session_start();

//Includes
include_once ('includes/funciones.php');

//Se comprueba si no existe en sesión ningún DNI y en tal caso se redirige a la página de login, en caso contrario se mete la sesión del DNI en la variable $dni
if (!isset($_SESSION['DNI'])) {
	header('Location: login.php');
} else {
	$dni = $_SESSION['DNI'];
}

//paginacion:
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

//Se obtiene los datos de los alumnos llamando a la función 'mostrarAlumnos'
try {
$profesores = "SELECT DNI, NOMBRE, APELLIDOS FROM PROFESORES";
} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}


//Se guarda la búsqueda en el caso de que ya se haya hecho
if (isset($_REQUEST["barra"])) {
	$busqueda = $_REQUEST["barra"];
	$etiquetas = ucwords($busqueda);
	$etiquetas = trim($etiquetas);
	try {
	$profesores = "SELECT DNI, NOMBRE, APELLIDOS FROM PROFESORES WHERE UPPER(TRANSLATE(NOMBRE, 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU')) LIKE UPPER(TRANSLATE('%$etiquetas%', 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU'))" . "OR DNI IN (SELECT DNI FROM PROFESORESIMPARTENASIGNATURAS WHERE CODIGO_ASIG IN (SELECT CODIGO_ASIG FROM ASIGNATURAS WHERE" . " UPPER(TRANSLATE(NOMBRE, 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU')) LIKE UPPER(TRANSLATE('%$etiquetas%', 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU'))))" . "OR OID_DEP IN (SELECT OID_DEP FROM DEPARTAMENTOS WHERE " . " UPPER(TRANSLATE(NOMBRE, 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU')) LIKE UPPER(TRANSLATE('%$etiquetas%', 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU')))";
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}
else{
	$busqueda = '';
}


//Se obtienen todas las tutorías del alumno paginadas
$ProfesoresPaginada = consultaPaginada($conexion, $profesores, $paginaSeleccionada, $paginaTamanio);


//Se obtiene el total de tutorias del alumno llamando a la función 'totalConsulta'
$totalRegistros = totalConsulta($conexion, $profesores);


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

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);

//Botón del menú que estará on
$menuBoton_on = 2;



//Botón del menú que estará on
$menuBoton_on = 7;

?>
<!DOCTYPE HTML>
<html lang='es'>
	<head>
		<title>Buscar profesor</title>
		<meta charset='utf-8' />
		<meta name='viewport' content='width=device-width, initial-scale=1.0' />
		<link rel='shortcut icon' type='image/x-icon' href='img/favicon.ico'>
		<link rel='stylesheet' type='text/css' href='css/general.css' />
		<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js'></script>
		<script type='text/javascript' src='js/funcionesJQuery.js'></script>
		<script type='text/javascript'>
			function borrar() {
				$('#barra').val('');
				
			}
		</script>
		<script>
function confirmar()
{
 if(confirm('¿Quiere eliminar el profesor?'))
 {
 return true;
 }
 else
 {
  return false;
 } 
}
</script>
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
		<?php include_once ('includes/menu.php');	?>

		<!--Contenido principal-->
		<main>
			<article>
				<div class='contenedor buscadorProfesor'>
					<br /><br /><br />
					<section class='col-100 tablet-100 movil-100'>
						<h1 class='alinearCentro titulillo'>Buscar profesor</h1>
					</section>
					<section class='col-100 tablet-100 movil-100'>
						<div class='formBuscar'>
							<form class='buscador' id='buscador' name='buscador' method='POST' action='buscarProfesorEliminar.php'>
								<input class='barra' onclick='borrar();' value='<?php echo $busqueda; ?>' id='barra' name='barra' type='text' placeholder='Introduce el nombre del profesor o asignatura' autofocus >
							</form>
						</div>
					</section>
				</div>
				<div class='contenedor buscadorProfesor'>
					<section class='col-100 tablet-100 movil-100'>
						<h1 class='alinearCentro titulillo'>Seleccione el profesor que desea eliminar</h1>
					</section>
				</div>
				<br />
				
						<section class='col-100 tablet-100 movil-100'>
							<h1 class='alinearCentro titulillo'>
					<?php
						for($pagina = 1; $pagina <= $totalPaginas; $pagina++) 
							if ( $pagina == $paginaSeleccionada) { 	?>
								<span class='current'><?php echo $pagina; ?></span>
							<?php 
							} else { ?>			
								<a class='enlacePaginacion' href='buscarProfesorEliminar.php?PAG_NUM=<?php echo $pagina; ?>&PAG_TAM=<?php echo $paginaTamanio; ?>'><?php echo $pagina; ?></a>
							<?php 
							} ?>
							</h1>
							</section>
					<div class='contenedor contenedorForm'>	
					<?php
					foreach($ProfesoresPaginada as $profesor) { ?>
						<form id='formBusqueda' method='POST' action='controladorEliminarProfesorAdmin.php' >
							<input type='hidden' name='DNI' value='<?php echo $profesor['DNI']?>'>
							<input type='submit' onclick="return confirmar()" name='nombreCompleto' value='<?php echo $profesor['NOMBRE'].' '.$profesor['APELLIDOS']; ?>'>
						</form>
					<?php 
					} ?>
				</div>
			</article>
			<div class='clear'></div>
		</main>
		<div class='clear'></div>

		<!--Pie-->
		<?php include ('includes/pie.php');	?>
	</body>
</html>