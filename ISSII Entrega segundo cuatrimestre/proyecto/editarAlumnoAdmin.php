<?php
//Inicio de sesiones
session_start();

//Includes
require_once ('includes/funciones.php');

//Se comprueba si no existe en sesión ningún DNI y en tal caso se redirige a la página de login, en caso contrario se mete la sesión del DNI en la variable $dni
if (!isset($_SESSION['DNI'])) {
	header('Location: login.php');
} else {
	if (isset($_REQUEST["DNI"])) {
		$_SESSION["DNIAlum"] = $_REQUEST["DNI"];
		$dni = $_REQUEST["DNI"];
	} else if (isset($_SESSION["dato"])) {
		$dato = $_SESSION["dato"];
		$dni = $dato["DNI"];
		unset($_SESSION["dato"]);
	} else{
		header('Location: buscarAlumnoEditar.php');
	}
	
}

//Se comprueba si existe en sesión modificarNombre y en tal caso, se mete en la variable $modificarNombre y se elimina su sesión
if (isset($_SESSION["modificarNombre"])) {
	$modificarNombre = $_SESSION["modificarNombre"];
	unset($_SESSION["modificarNombre"]);
}

//Se comprueba si existe en sesión modificarApellidos y en tal caso, se mete en la variable $modificarApellidos y se elimina su sesión
if (isset($_SESSION["modificarApellidos"])) {
	$modificarApellidos = $_SESSION["modificarApellidos"];
	unset($_SESSION["modificarApellidos"]);
}

//Se comprueba si existe en sesión modificarFechaNacimiento y en tal caso, se mete en la variable $modificarFechaNacimiento y se elimina su sesión
if (isset($_SESSION["modificarFechaNacimiento"])) {
	$modificarFechaNacimiento = $_SESSION["modificarFechaNacimiento"];
	unset($_SESSION["modificarFechaNacimiento"]);
}

//Se comprueba si existe en sesión modificarEmail y en tal caso, se mete en la variable $modificarEmail y se elimina su sesión
if (isset($_SESSION["modificarEmail"])) {
	$modificarEmail = $_SESSION["modificarEmail"];
	unset($_SESSION["modificarEmail"]);
}
//Se comprueba si existe en sesión modificarTelefono y en tal caso, se mete en la variable $modificarEmail y se elimina su sesión
if (isset($_SESSION["modificarTelefono"])) {
	$modificarTelefono = $_SESSION["modificarTelefono"];
	unset($_SESSION["modificarTelefono"]);
}
//Se comprueba si existe en sesión modificardireccion y en tal caso, se mete en la variable $modificarEmail y se elimina su sesión
if (isset($_SESSION["modificardireccion"])) {
	$modificardireccion = $_SESSION["modificardireccion"];
	unset($_SESSION["modificardireccion"]);
}
//Se comprueba si existe en sesión modificarprovincia y en tal caso, se mete en la variable $modificarEmail y se elimina su sesión
if (isset($_SESSION["modificarprovincia"])) {
	$modificarprovincia = $_SESSION["modificarprovincia"];
	unset($_SESSION["modificarprovincia"]);
}
//Se comprueba si existe en sesión modificarCodigo_postal y en tal caso, se mete en la variable $modificarEmail y se elimina su sesión
if (isset($_SESSION["modificarCodigo_postal"])) {
	$modificarCodigo_postal = $_SESSION["modificarCodigo_postal"];
	unset($_SESSION["modificarCodigo_postal"]);
}

//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Se obtienen los datos del alumno para $dni llamando a la función 'getInfoAlumno'
$datos = getInfoAlumno($conexion, $dni);

//Se obtienen los datos del grupo del alumno para $dni llamando a la función 'getGrupoAlumno'
$grupo = getGrupoAlumno($conexion, $dni);

//Se obtiene el grado del alumno para $dni llamando a la función 'getGradoAlumno'
$grado = getGradoAlumno($conexion, $dni);

//Se obtiene el curso del alumno para $dni llamando a la función 'getCursoAlumno'
$curso = getCursoAlumno($conexion, $dni);

//Se obtiene las asignaturas del alumno para $dni llamando a la función 'getCodigoAsignaturas'
$codAsignaturas = getCodigoAsignaturas($conexion, $dni);
$user_agent = $_SERVER['HTTP_USER_AGENT'];
//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);

//Botón del menú que estará on
$menuBoton_on = 8;

?>
<!DOCTYPE HTML>
<html lang='es'>
	<head>
		<title>Editar Alumno</title>
		<meta charset='utf-8' />
		<meta name='viewport' content='width=device-width, initial-scale=1.0' />
		<link rel='shortcut icon' type='image/x-icon' href='img/favicon.ico'>
		<link rel='stylesheet' type='text/css' href='css/general.css' />
		<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js'></script>
		<script type='text/javascript' src='js/funcionesJQuery.js'></script>
		<script>
			$(document).ready(function() {
				editarPerfil();
				validaForm1();
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
				<div class='contenedor paddingsEspacios editarAlumno'>
					<section class='col-100 tablet-100 movil-100'>
						<h1 class='alinearCentro titulillo'>Editar perfil de <?php echo $datos["NOMBRE"]; ?></h1>
					</section>
					<br /><br /><br />
					<div class='col-100 tablet-col-100 movil-col-100 alinearCentro datosAlumno'>
						<form method="POST" action="controladorEditarAlumnoAdmin.php">
							<br />
							<input name="DNI" type="hidden" value="<?php echo $dni; ?>" />	
							<input name="nombre" type="hidden" value="<?php echo $datos["NOMBRE"]; ?>" />
							<input name="apellidos" type="hidden" value="<?php echo $datos["APELLIDOS"]; ?>" />	
							<input name="fechaNacimiento" type="hidden" value="<?php echo $datos["FECHA_NACIMIENTO"]; ?>" />
							<input name="email" type="hidden" value="<?php echo $datos["EMAIL"]; ?>" />
							<input name="grupo" type="hidden" value="<?php echo $grupo['OID_GRUP']; ?>"/>
							<input name="grado" type="hidden" value="<?php echo $grado['OID_G']; ?>"/>
							<input name="curso" type="hidden" value="<?php echo $curso['CURSO']; ?>"/>
							<input name="Telefono" type="hidden" value="<?php echo $datos['TELEFONO']; ?>"/>
							<input name="direccion" type="hidden" value="<?php echo $datos['DIRECCION']; ?>"/>
							<input name="provincia" type="hidden" value="<?php echo $datos['PROVINCIA']; ?>"/>
							<input name="Codigo_postal" type="hidden" value="<?php echo $datos['Codigo_postal']; ?>"/>
									
							<?php
							if (isset($dato) && isset($modificarNombre)) {?>
								<p class="dato">Nombre: <input id="nombre" name="modificarNombre" type="text" value="<?php echo $datos["NOMBRE"]; ?>"/></p>
								<div class="botones">
									<button name="grabarNombre" id="grabarNombre"  type="submit" class="editarDato">
										<img src="img/varios/guardar.png" class="grabar" alt="Grabar dato nombre">
									</button>
									<button id="cancelar" name="cancelarNombre" type="submit" class="editarDato">
										<img src="img/varios/cancelar.png" class="cancelar" alt="Cancelar">
									</button>
								</div>
							<?php 
							} else { ?>
								<p id="nombre" class="dato">Nombre: <?php echo $datos["NOMBRE"]; ?></p>
								<div class="botones">
									<button name="editarNombre" type="submit" class="editarDato">
										<img src="img/varios/editar.png" class="editar" alt="Editar Dato" >
									</button>
								</div>	
							<?php 
							}
							if (isset($dato) && isset($modificarApellidos)) {?>
								<p class="dato">Apellidos: <input name="modificarApellidos" id="apellidos" type="text" value="<?php echo $datos["APELLIDOS"]; ?>"/></p>
								<div class="botones">
									<button name="grabarApellidos" type="submit" id="grabarApellidos" class="editarDato">
										<img src="img/varios/guardar.png" class="grabar" alt="Grabar dato apellidos">
									</button>
									<button name="cancelarApellidos" type="submit" class="editarDato">
										<img src="img/varios/cancelar.png" class="cancelar" alt="Cancelar">
									</button>
								</div>
							<?php 
							} else { ?>
								<p class="dato">Apellidos: <?php echo $datos["APELLIDOS"]; ?></p>
								<div class="botones">
									<button name="editarApellidos" type="submit" class="editarDato">
										<img src="img/varios/editar.png" class="editar" alt="Editar Dato" >
									</button>
								</div>	
							<?php 
							}
							if (isset($dato) && isset($modificarFechaNacimiento)) {?>
								<p class="dato">Fecha de nacimiento: <input id="fecha" name="modificarFechaNacimiento" type="text" value="<?php echo $datos["FECHA_NACIMIENTO"]; ?>"/></p>
								<div class="botones">
									<button name="grabarFechaNacimiento" type="submit" class="editarDato" id="grabarFecha">
										<img src="img/varios/guardar.png" class="grabar" alt="Grabar dato fecha de nacimiento">
									</button>
									<button name="cancelarFechaNacimiento" id="cancelar" type="submit" class="editarDato">
										<img src="img/varios/cancelar.png" class="cancelar" alt="Cancelar">
									</button>
								</div>
							<?php 
							} else { ?>
								<p class="dato">Fecha de nacimiento: <?php echo $datos["FECHA_NACIMIENTO"]; ?></p>
								<div class="botones">
									<button name="editarFechaNacimiento" type="submit" class="editarDato">
										<img src="img/varios/editar.png" class="editar" alt="Editar Dato" >
									</button>
								</div>	
							<?php 
							}
							if (isset($dato) && isset($modificarEmail)) {?>
								<p class="dato">Email: <input name="modificarEmail" id="email" type="text" value="<?php echo $datos["EMAIL"]; ?>"/></p>
								<div class="botones">
									<button name="grabarEmail" type="submit" class="editarDato" id="grabarEmail">
										<img src="img/varios/guardar.png" class="grabar" alt="Grabar dato email">
									</button>
									<button name="cancelarEmail" type="submit" class="editarDato">
										<img src="img/varios/cancelar.png" class="cancelar" alt="Cancelar">
									</button>
								</div>
							<?php 
							} else { ?>
								<p class="dato">Email: <?php echo $datos["EMAIL"]; ?></p>
								<div class="botones">
									<button name="editarEmail" type="submit" class="editarDato">
										<img src="img/varios/editar.png" class="editar" alt="Editar Dato" >
									</button>
								</div>	
							<?php 
							}
							if (isset($dato) && isset($modificarTelefono)) {?>
								<p class="dato">Telefono: <input name="modificarTelefono" id="telefono" type="text" value="<?php echo $datos["TELEFONO"]; ?>"/></p>
								<div class="botones">
									<button name="grabarTelefono" type="submit" class="editarDato" id="grabarTelefono">
										<img src="img/varios/guardar.png" class="grabar" alt="Grabar dato Telefono">
									</button>
									<button name="cancelarTelefono" type="submit" class="editarDato">
										<img src="img/varios/cancelar.png" class="cancelar" alt="Cancelar">
									</button>
								</div>
							<?php 
							} else { ?>
								<p class="dato">Telefono: <?php echo $datos["TELEFONO"]; ?></p>
								<div class="botones">
									<button name="editarTelefono" type="submit" class="editarDato">
										<img src="img/varios/editar.png" class="editar" alt="Editar Dato" >
									</button>
								</div>	
								<?php 
							}
									if (isset($dato) && isset($modificardireccion)) {?>
								<p class="dato">Direccion: <input name="modificardireccion" id="direccion" type="text" value="<?php echo $datos["DIRECCION"]; ?>"/></p>
								<div class="botones">
									<button name="grabardireccion" type="submit" class="editarDato" id="grabarDireccion">
										<img src="img/varios/guardar.png" class="grabar" alt="Grabar dato direccion">
									</button>
									<button name="cancelardireccion" type="submit" class="editarDato">
										<img src="img/varios/cancelar.png" class="cancelar" alt="Cancelar">
									</button>
								</div>
							<?php 
							} else { ?>
								<p class="dato">Direccion: <?php echo $datos["DIRECCION"]; ?></p>
								<div class="botones">
									<button name="editardireccion" type="submit" class="editarDato">
										<img src="img/varios/editar.png" class="editar" alt="Editar Dato" >
									</button>
								</div>		
									<?php 
							}
									if (isset($dato) && isset($modificarprovincia)) {?>
								<p class="dato">Provincia: <input name="modificarprovincia" id="provincia" type="text" value="<?php echo $datos["PROVINCIA"]; ?>"/></p>
								<div class="botones">
									<button name="grabarprovincia" type="submit" class="editarDato" id="grabarProvincia">
										<img src="img/varios/guardar.png" class="grabar" alt="Grabar dato provincia">
									</button>
									<button name="cancelarprovincia" type="submit" class="editarDato">
										<img src="img/varios/cancelar.png" class="cancelar" alt="Cancelar">
									</button>
								</div>
							<?php 
							} else { ?>
								<p class="dato">Provincia: <?php echo $datos["PROVINCIA"]; ?></p>
								<div class="botones">
									<button name="editarprovincia" type="submit" class="editarDato">
										<img src="img/varios/editar.png" class="editar" alt="Editar Dato" >
									</button>
								</div>	
											<?php 
							}
							if (isset($dato) && isset($modificarCodigo_postal)) {?>
								<p class="dato">Codigo postal: <input name="modificarCodigo_postal" id="cpostal" type="text" value="<?php echo $datos["CODIGO_POSTAL"]; ?>"/></p>
								<div class="botones">
									<button name="grabarCodigo_postal" type="submit" class="editarDato" id="grabarCP">
										<img src="img/varios/guardar.png" class="grabar" alt="Grabar dato Codigo_postal">
									</button>
									<button name="cancelarCodigo_postal" type="submit" class="editarDato">
										<img src="img/varios/cancelar.png" class="cancelar" alt="Cancelar">
									</button>
								</div>
							<?php 
							} else { ?>
								<p class="dato">Codigo postal: <?php echo $datos["CODIGO_POSTAL"]; ?></p>
								<div class="botones">
									<button name="editarCodigo_postal" type="submit" class="editarDato">
										<img src="img/varios/editar.png" class="editar" alt="Editar Dato" >
									</button>
								</div>	
							<?php 
							
							} ?>
							<br />
						</form>
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