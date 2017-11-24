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

//Variable para el estilo del desplegable de horarios de tutorias
$display = "none";

//Se comprueba si existe en sesión algún dato y en tal caso, se mete en la variable $dato y se elimina su sesión
if (isset($_SESSION["dato"])) {
	$dato = $_SESSION["dato"];
	unset($_SESSION["dato"]);
}

//Se comprueba si existe en sesión modificarDespacho y en tal caso, se mete en la variable $modificarDespacho y se elimina su sesión
if (isset($_SESSION["modificarDespacho"])) {
	$modificarDespacho = $_SESSION["modificarDespacho"];
	unset($_SESSION["modificarDespacho"]);
}

//Se comprueba si existe en sesión modificarDepartamento y en tal caso, se mete en la variable $modificarDepartamento y se elimina su sesión
if (isset($_SESSION["modificarDepartamento"])) {
	$modificarDepartamento = $_SESSION["modificarDepartamento"];
	unset($_SESSION["modificarDepartamento"]);
}

//Se comprueba si existe en sesión modificarCategoria y en tal caso, se mete en la variable $modificarCategoria y se elimina su sesión
if (isset($_SESSION["modificarCategoria"])) {
	$modificarCategoria = $_SESSION["modificarCategoria"];
	unset($_SESSION["modificarCategoria"]);
}

//Se comprueba si existe en sesión modificarHorario y en tal caso, se mete en la variable $modificarHorario y se elimina su sesión
if (isset($_SESSION["modificarHorario"])) {
	$modificarHorario = $_SESSION["modificarHorario"];
	$display = "block";
	unset($_SESSION["modificarHorario"]);
}

//Se comprueba si existe en sesión modificarDia y en tal caso, se mete en la variable $modificarDia y se elimina su sesión
if (isset($_SESSION["modificarDia"])) {
	$modificarDia = $_SESSION["modificarDia"];
	$display = "block";
	unset($_SESSION["modificarDia"]);
}


//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Se obtienen los datos del profesor para $dni llamando a la función 'getInfoProfesor'
$datos = getInfoProfesor($conexion, $dni);

//Se obtienen los datos del horario del profesor para $dni llamando a la función 'getInfoHorarioProfesores'
$infoTutorias = getInfoHorarioProfesores($conexion, $dni);

//Se obtiene el nombre del despacho del profesor para $datos llamando a la función 'nombreDespacho'
$despacho = nombreDespacho($conexion, $datos["OID_D"]);

//Se obtiene el nombre del departamento del profesor para $datos llamando a la función 'nombreDepartamento'
$departamento = nombreDepartamento($conexion, $datos["OID_DEP"]);

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);
			
//Botón del menú que estará on
$menuBoton_on = 4;

?>
<!DOCTYPE HTML>
<html lang='es'>
	<head>
		<title>Editar Profesor</title>
		<meta charset='utf-8' />
		<meta name='viewport' content='width=device-width, initial-scale=1.0' />
		<link rel='shortcut icon' type='image/x-icon' href='img/favicon.ico'>
		<link rel='stylesheet' type='text/css' href='css/general.css' />
		<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js'></script>
		<script type='text/javascript' src='js/funcionesJQuery.js'></script>
		<script>
			$(document).ready(function() {
				mostrarOcultarTutorias();
				mostrarOcultarFormularioMeterTutoria();
				validarMeterHorario();
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
				<div class='contenedor paddingsEspacios editarProfesor'>
					<section class='col-100 tablet-100 movil-100'>
						<h1 class='alinearCentro titulillo'>Perfil</h1>
					</section>
					<br /><br /><br />
					<div class='col-100 tablet-col-100 movil-col-100 alinearCentro datosProfesor'>
						<form method="POST" action="controladorEditarProfesor.php">
							<input name="DNI" type="hidden" value="<?php echo $dni; ?>" />	
							<input name="nombre" type="hidden" value="<?php echo $datos["NOMBRE"]; ?>" />
							<input name="apellidos" type="hidden" value="<?php echo $datos["APELLIDOS"]; ?>" />	
							<input name="fechaNacimiento" type="hidden" value="<?php echo $datos["FECHA_NACIMIENTO"]; ?>" />
							<input name="email" type="hidden" value="<?php echo $datos["EMAIL"]; ?>" />
							<input name="categoria" type="hidden" value="<?php echo $datos["CATEGORIA"]; ?>" />	
							<input name="despacho" type="hidden" value="<?php echo $datos["OID_D"]; ?>" />	
							<input name="departamento" type="hidden" value="<?php echo $datos["OID_DEP"]; ?>" />			
							<b><h1 class="datoProf">Datos personales</h1></b>
							<p class="dato">Nombre: <?php echo $datos["NOMBRE"]; ?></p>
							<p class="dato">Apellidos: <?php echo $datos["APELLIDOS"]; ?></p>
							<p class="dato">Fecha de Nacimiento: <?php echo $datos["FECHA_NACIMIENTO"]; ?></p>
							<p class="dato">Email: <?php echo $datos["EMAIL"]; ?></p>
							<br /><br>
							
							<!-- // <?php
							// /*if (isset($dato) && isset($modificarDespacho)) {?>
								// <p class="dato">Despacho: <input name="modificarDespacho" type="text" value="<?php echo $despacho["NOMBRE"]; ?>"/></p>
								// <button name="grabarDespacho" type="submit" class="editarDato">
									// <img src="img/varios/guardar.png" class="grabar" alt="Grabar dato despacho">
								// </button>
								// <button name="cancelarDespacho" type="submit" class="editarDato">
									// <img src="img/varios/cancelar.png" class="cancelar" alt="Cancelar">
								// </button>
						// <?php 
							// } else { */?> -->
								
								<p class="dato">Despacho: <?php echo $despacho["NOMBRE"]; ?></p>
								
								<!-- <button name="editarDespacho" type="submit" class="editarDato">
									<img src="img/varios/editar.png" class="editar" alt="Editar Dato" >
								</button> -->
								
							<!-- <?php 
							
							/*if (isset($dato) && isset($modificarDepartamento)) {?>
								<p>Departamento: <input name="modificarDepartamento" type="text" value="<?php echo $departamento["NOMBRE"]; ?>"/></p>
								<select class="dato" id="departamento" name="departamento" size="1" required>
									<option value="4">Arquitectura y Tecnolog. de Computadores</option>
									<option value="1">Biología Celular</option>
									<option value="CIR">Cirugía</option> 
									<option value="2">Electrónica y Electromagnetismo</option>
									<option value="3">Ciencias de la Comput. e Int. Artificial</option>
									<option value="FA1">Física Aplicada I</option>
									<option value="FMC">Física de la Materia Condensada</option>
									<option value=">FMB">Fisiología Médica y Biofísica</option>
									<option value="G">Genética</option>
									<option value="5">Ingeniería Aeroespacial y Mecánica de Fluidos</option>
									<option value="6">Ingeniería de Sistemas y Automática</option>
									 <option value="ICMT">Ingeniería y Ciencia de los Materiales y del Transporte</option> 
									<option value="7">Lenguajes y Sistemas Informáticos</option>
									<option value="8">Matemática Aplicada I</option>
									<option value="MMCTE">Mecánica de Medios Contínuos, Teoría de Estructuras</option>
									<option value="MPSP">Medicina Preventiva y Salud Pública</option>
									<option value="OIGE1">Organización Industrial y Gestión Empr. I</option>
									<option value="OIGE2">Organización Industrial y Gestión Empr. II</option>
									<option value="9">Tecnología Electrónica</option><br />
								</select>
								<div class="botones">
									<button name="grabarDepartamento" type="submit" class="editarDato">
										<img src="img/varios/guardar.png" class="grabar" alt="Grabar dato departamento">
									</button>
									<button name="cancelarDepartamento" type="submit" class="editarDato">
										<img src="img/varios/cancelar.png" class="cancelar" alt="Cancelar">
									</button>
								</div>
							<?php 
							} else { */?> -->
								<p class="dato">Departamento: <?php echo $departamento["NOMBRE"]; ?></p>
								
								<!-- <div class="botones">
									<button name="editarDepartamento" type="submit" class="editarDato">
										<img src="img/varios/editar.png" class="editar" alt="Editar dato departamento">
									</button>
								</div>	 -->
							<!-- <?php 
							/*}
							if (isset($dato) && isset($modificarCategoria)) {?>
								<!--<p>Categoría: <input name="modificarCategoria" type="text" value="<?php echo $datos["Categoria"]; ?>"/></p>
								<label class="dato" for="categoria">Categoría:
									<select  id="categoria" name="categoria" size="1" required>
										<option value="Catedrático">Catedrático</option>
										<option value="Titular">Titular</option>
										<option value="Contratado doctor">Contratado doctor</option>
										<option value="Colaborador">Colaborador</option>
										<option value="Ayudante doctor">Ayudante doctor</option>
										<option value="Ayudante">Ayudante</option>
										<option value="Interino">Interino</option>
									</select>
								</label>
								<div class="botones">
									<button name="grabarCategoria" type="submit" class="editarDato">
										<img src="img/varios/guardar.png" class="grabar" alt="Grabar dato despacho">
									</button>
									<button name="cancelarCategoria" type="submit" class="editarDato">
										<img src="img/varios/cancelar.png" class="cancelar" alt="Cancelar">
									</button>
								</div>
							<?php 
							} else { */?> -->
								
								<p class="dato">Categoría: <?php echo $datos["CATEGORIA"]; ?></p>	
								
								<!-- <div class="botones">
									<button name="editarCategoria" type="submit" class="editarDato">
										<img src="img/varios/editar.png" class="editar" alt="Editar Dato" >
									</button>
								</div> -->	
							<?php 
							//} ?>
							<br />
							<h1><b class="tituloTuto">Información de tutorías</b></h1>
							<div class="posicionarIzquierda divBoton">
								<button type="button" id="mostrarInfoTutorias" class="botonDesplegable">
								<img class="flechaImg" src="img/varios/downArrow.png" alt="Desplegable" />
								</button>
							</div>
							<div class="infoTutorias" style="display: <?php echo $display; ?>;">
								<?php 
								$i = 0;
								foreach ($infoTutorias as $infoTutoria) {
									if (isset($dato) && isset($modificarDia) && $modificarDia == $i) { ?>
										<div class="dato">
											<label class="dato" for="dia">Dia:
												<select id="modificarDia" name="modificarDia" size="1" required>
													<option value="Lunes">Lunes</option>
													<option value="Martes">Martes</option>
													<option value="Miércoles">Miércoles</option>
													<option value="Jueves">Jueves</option>
													<option value="Viernes">Viernes</option>
												</select>
											</label>
											<input type="hidden" name="OID_H" value="<?php echo $infoTutoria["OID_H"]; ?>" />
										</div>
										<button name="grabarDia" type="submit" class="editarDato">
											<img src="img/varios/guardar.png" class="grabar" alt="Grabar dato horario">
										</button>
										<button name="cancelarDia" type="submit" class="editarDato">
											<img src="img/varios/cancelar.png" class="cancelar" alt="Cancelar">
										</button>
									<?php 
									} else { ?>
										<div class="dato">
											<p class="dato">Dia: <?php echo $infoTutoria["DIA"]; ?></p>
										</div>
										<div class="botones">
											<button name="editarDia" value="<?php echo $i; ?>" type="submit" class="editarDato">
												<img src="img/varios/editar.png" class="editar" alt="Editar dato dia">
											</button>
										</div>			
									<?php
									}
									if (isset($dato) && isset($modificarHorario) && $modificarHorario == $i) { ?>
										<div class="dato">
											<p>Hora inicio tutoria: <input name="modificarHorarioInicioTutorias" type="text" value="<?php echo $infoTutoria["HORA_COMIENZO_TUTORIA"]; ?>"/></p>
											<p>Hora fin tutoria: <input name="modificarHorarioFinTutorias" type="text" value="<?php echo $infoTutoria["HORA_FIN_TUTORIA"]; ?>"/></p>
											<input type="hidden" name="OID_H" value="<?php echo $infoTutoria["OID_H"]; ?>" />
										</div>
										<div class="botones">
											<button name="grabarHorario" type="submit" class="editarDato">
												<img src="img/varios/guardar.png" class="grabar" alt="Grabar dato horario">
											</button>
											<button name="cancelarHorario" type="submit" class="editarDato">
												<img src="img/varios/cancelar.png" class="cancelar" alt="Cancelar">
											</button>
										</div>
									<?php 
									} else { ?>
										<div class="dato">
											<p>Horario inicio tutoria: <?php echo $infoTutoria["HORA_COMIENZO_TUTORIA"]; ?></p>
											<p>Horario fin tutoria: <?php echo $infoTutoria["HORA_FIN_TUTORIA"]; ?></p>	
										</div>
										<div class="botones">
											<button name="editarHorario" value="<?php echo $i; ?>" type="submit" class="editarDato">
												<img src="img/varios/editar.png" class="editar" alt="Editar dato horario">
											</button>
											<button name="eliminarTutoria" value="<?php echo $infoTutoria["OID_H"]; ?>" type="submit" class="editarDato">
												<img src="img/varios/denegar.png" class="cancelar" alt="Eliminar dato horario">
											</button>
										</div>	
												
									<?php
									} ?>
									<br /><br />
									<?php
									$i++;
								} ?>					
							</div>
						</form>
						<br />
						<br />
						<button type="button" class="mostrarFormHorarioTutoria" id="mostrarFormHorarioTutoria" name="mostrarFormHorarioTutoria">Introducir una nueva tutoría</button>
						<br />
						<br />
						<form class="formMeterHorarioTutoria" action="controladorInsertarHorarioTutoria.php" method="post" >
							<input name="DNI" type="hidden" value="<?php echo $dni; ?>" />
							<input name="noAdmin" type="hidden" value="esteUsuarioNoEsAdmin" />
							<p class="dato">Hora de inicio:<input type="text" id="inputHoraInicio" name="inputHoraInicio" placeholder=" HH:MM" />	</p>		
							<p class="dato">Hora de fin:<input type="text" id="inputHoraFin" name="inputHoraFin" placeholder=" HH:MM"/>	</p>		
							<label class="dato" for="dia">Dia:
									<select name="inputDia" size="1" required>
										<option value="Lunes">Lunes</option>
										<option value="Martes">Martes</option>
										<option value="Miércoles">Miércoles</option>
										<option value="Jueves">Jueves</option>
										<option value="Viernes">Viernes</option>
									</select>
								<input type="submit" id="confirmarHorario" value="Confirmar" />
								</label>		
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