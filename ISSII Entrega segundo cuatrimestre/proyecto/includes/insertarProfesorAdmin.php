<?php
//Inicio de sesiones
session_start();

//Includes
require_once ('includes/funciones.php');

//Si no existen datos del formulario en la sesión, se crea una entrada con valores por defecto y se meten en la sesión, en caso contrario se meten los datos de la sesión en la variable $formulario
if (!isset($_SESSION['formulario'])) {
	$formulario['dni'] = "";
	$formulario['nombre'] = "";
	$formulario['apellidos'] = "";
	$formulario['email'] = "";
	$formulario['fecha'] = "";
	$formulario['curso'] = "";
	$formulario['modalidad'] = "";
	$formulario['departamento'] = "";
	$formulario['despacho'] = "";
	
	$_SESSION['formulario'] = $formulario;
}
else{
	$formulario = $_SESSION['formulario'];
}
//Obtenemos los despachos y su ocupación
$conexion = crearConexionBD();
$despachos = getDespachos ($conexion);
$despachosLibres = array();
foreach($despachos as $despacho){
	if($despacho["CAPACIDAD"] - getOcupacion ($conexion,$despacho["OID_D"])>0){
		array_push($despachosLibres,$despacho);
	}
}
cerrarConexionBD($conexion);
//Se comprueba si existe en sesión algún error y en tal caso se mete en la variable $errores
if (isset($_SESSION['errores'])) {
	$errores = $_SESSION['errores'];
}

//Variable para obtener el cliente desde el que está accediendo el usuario
$user_agent = $_SERVER['HTTP_USER_AGENT'];

//Botón del menú que estará on
$menuBoton_on = 5;
?>

<!DOCTYPE HTML>
<html lang='es'>
	<head>
		<title>Introducir Profesor</title>
		<meta charset='utf-8' />
		<meta name='viewport' content='width=device-width, initial-scale=1.0' />
		<link rel='shortcut icon' type='image/x-icon' href='img/favicon.ico'>
		<link rel='stylesheet' type='text/css' href='css/general.css' />
		<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js'></script>
		<script type='text/javascript' src='js/funcionesJQuery.js'></script>
		<script>
			$(document).ready(function() {
				desplegarAsignaturas();
				InsertarProfesor();
				$(".asignaturas").css("display","none");
				
			});
		</script>
	</head>
	<body>
		<!--Cabecera-->
		<?php include_once ('includes/cabecera.php'); ?>

		<!--Menú-->
		<?php include_once ('includes/menu.php'); ?>
		
		<!--Contenido principal-->
		<main class='contenedor matriculacion'>	<!--El estilo de formulario de matriculacion es el mismo-->
			<article class='col-100 tablet-col-100 movil-col-100'>
				<h1 class='alinearCentro titulillo'>Insertar Profesor</h1>
					</section>
					<br /><br />
					<?php 
						//Se comprueba si existe en sesión algún error y en tal caso se mete en la variable $errores
						if (isset($_SESSION['errores'])) {
					?>
							<div class="errores">
									<ul>
						<?php		
									$errores = $_SESSION['errores'];
									
									foreach ($errores as $error ) {
										echo "<li> $error </li>";
									}
						?>	
									</ul>
							</div>
					<?php	
						}
					?>
					
					
					<br />
				<div class="todo" id="todo">
					<div class="dper">
						<form target="_blank" id="formulario" method="POST" action="accionInsertarProfesorAdmin.php">
							<fieldset class="dp">
								<legend>Introducir Profesor</legend>
								<label for='nombre'>Nombre:</label>
									<input id='nombre' name='nombre' type='text' required />
								<label for='apellidos'>Apellidos:</label>
									<input id='apellidos' name='apellidos' type='text' required /><br />
								<label for='dni'>DNI/NIF:</label>
									<input id='dni' name='dni' type='text' required /><br />
								<label for='email'>Correo electrónico:</label>
									<input id='email' name='email' type='text' required /><br />
								<label for='fecha'>Fecha de nacimiento:</label>
									<input id='fecha' name='fecha' type=<?php if(strpos($user_agent, 'Firefox') !== FALSE){ echo 'text'; ?>	placeholder= 'DD/MM/YYYY' <?php } else{	echo 'date'; } ?> required /><br />
								<label for="departamento">Departamento:</label>
									<select id="departamento" name="departamento" size="1" required>
										<option value="0">Seleccione Departamento</option>
										<option value="1">Administración Empresas y C.I.M. (Mark.)</option>
										<option value="2">Anatomía y Embriología Humana</option>
										<option value="3">Arquitectura y Tecnolog. de Computadores</option>
										<option value="4"> Biología Celular</option>
										<option value="5">Bioquímica Médica y Biología Molecular</option>
										<option value="6">Cirugía</option>
										<option value="17">Electrónica y Electromagnetismo</option>
										<option value="8">Estadística e Investigación Operativa</option>
										<option value="9">Filosofía del Derecho</option>
										<option value="10">Física Aplicada I</option>
										<option value="11">Física de la Materia Condensada</option>
										<option value="12">Fisiología Médica y Biofísica</option>
										<option value="13">Genética</option>
										<option value="14">Ingeniería Aeroespacial y Mecánica de Fluidos</option>
										<option value="15">Ingeniería de Sistemas y Automática</option>
										<option value="16">Ingeniería y Ciencia de los Materiales y del Transporte</option>
										<option value="7">Lenguajes y Sistemas Informáticos</option>
										<option value="18">Matemática Aplicada I</option>
										<option value="19">Mecánica de Medios Contínuos, Teoría de Estructuras</option>
										<option value="20">Medicina Preventiva y Salud Pública</option>
										<option value="21">Organización Industrial y Gestión Empr. I</option>
										<option value="22">Organización Industrial y Gestión Empr. II</option>
										<option value="23">Tecnología Electrónica</option>
									</select>
								<br />
								<label for="categoria">Categoría:</label>
									<select id="categoria" name="categoria" size="1" required>
										<option value=" ">Seleccione Categoria</option>
										<option value="Catedratico">Catedratico</option>
										<option value="Titular">Titular</option>
										<option value="Contratado doctor">Contratado doctor</option>
										<option value="Colaborador">Colaborador</option>
										<option value="Ayudante doctor">Ayudante doctor</option>
										<option value="Ayudante">Ayudante</option>
										<option value="Interino">Interino</option>
									</select>
								<br />	
								<label for="despacho">Despacho:</label>
									<select class='curso' id="despacho" name="despacho" size='1' required>
										<?php foreach($despachosLibres as $despacho){
											echo "<option value='" .$despacho["NOMBRE"] ." '> " .$despacho['NOMBRE'] ."</option>";
										}?>
								</select><br />
								<label for='curso'>Curso:</label>
								<select class='curso' id='curso' name='curso' size='1' required>
									<option value='0'>Seleccionar</option>
									<option value='1'>1</option>
									<option value='2'>2</option>
									<option value='3'>3</option>
									<option value='4'>4</option>
								</select><br />
								<div class="asignaturas">
								<label class ='asignaturas' for='asignaturas'>Asignaturas:</label><br />
									<div class='asigs1'>
										<input name=asignaturas[] type='checkbox'>
										Administración de Empresas
										<br />
										<input name=asignaturas[] type='checkbox'>
										Álgebra Lineal y Numérica
										<br />
										<input name=asignaturas[] type='checkbox'>
										Cálculo Infinitesimal y Numérico
										<br />
										<input name=asignaturas[] type='checkbox'>
										Circuitos Electrónicos Digitales
										<br />
										<input name=asignaturas[] type='checkbox'>
										Estadística
										<br />
										<input name=asignaturas[] type='checkbox'>
										Estructura de Computadores
										<br />
										<input name=asignaturas[] type='checkbox'>
										Fundamentos de Programación
										<br />
										<input name=asignaturas[] type='checkbox'>
										Fundamentos Físicos de la Informática
										<br />
										<input name=asignaturas[] type='checkbox'>
										Introducción a la Matemática Discreta
										<br />
									</div>
									<div class='asigs2'>
										<input name=asignaturas[] type='checkbox'>
										Análisis y Diseño de Datos y Algoritmos
										<br />
										<input name=asignaturas[] type='checkbox'>
										Introducción a la Ingeniería del Software y los Sistemas de Información
										<br />
										<input name=asignaturas[] type='checkbox'>
										Lógica Informática
										<br />
										<input name=asignaturas[] type='checkbox'>
										Redes de Computadores
										<br />
										<input name=asignaturas[] type='checkbox'>
										Sistemas Operativos
										<br />
										<input name=asignaturas[] type='checkbox'>
										Arquitectura de Computadores
										<br />
										<input name=asignaturas[] type='checkbox'>
										Arquitectura e Integración de Sistemas Software
										<br />
										<input name=asignaturas[] type='checkbox'>
										Matemática Discreta
										<br />
									</div>
									<div class='asigs3'>
										<input name=asignaturas[] type='checkbox'>
										Diseño y Pruebas
										<br />
										<input name=asignaturas[] type='checkbox'>
										Proceso Software y Gestión
										<br />
										<input name=asignaturas[] type='checkbox'>
										Ingeniería de Requisitos
										<br />
										<input name=asignaturas[] type='checkbox'>
										Modelado y Simulación Numérica
										<br />
										<input name=asignaturas[] type='checkbox'>
										Procesamiento de Señales Multimedia
										<br />
										<input name=asignaturas[] type='checkbox'>
										Arquitectura y Servicios de Redes
										<br />
										<input name=asignaturas[] type='checkbox'>
										Inteligencia Artificial
										<br />
										<input name=asignaturas[] type='checkbox'>
										Modelado y Visualización Gráfica
										<br />
		
									</div>
									<div class='asigs4'>
										<input name=asignaturas[] type='checkbox'>
										Prácticas Externas
										<br />
										<input name=asignaturas[] type='checkbox'>
										Acceso Inteligente a la Información
										<br />
										<input name=asignaturas[] type='checkbox'>
										Ampliación de Administración de Empresas
										<br />
										<input name=asignaturas[] type='checkbox'>
										Aplicaciones de Soft Computing
										<br />
										<input name=asignaturas[] type='checkbox'>
										Criptografía
										<br />
										<input name=asignaturas[] type='checkbox'>
										Derecho en la Informática
										<br />
										<input name=asignaturas[] type='checkbox'>
										Evolución y Gestión de la Configuración
										<br />
										<input name=asignaturas[] type='checkbox'>
										Gestión de la Producción
										<br />
										<input name=asignaturas[] type='checkbox'>
										Métodos Cuantitativos de Gestión
										<br />
										<input name=asignaturas[] type='checkbox'>
										Planificación y Gestión de Proyectos Informáticos
										<br />
										<input name=asignaturas[] type='checkbox'>
										Tecnología, Informática y Sociedad
										<br />
										<input name=asignaturas[] type='checkbox'>
										Complementos de Bases de Datos
										<br />
										<input name=asignaturas[] type='checkbox'>
										Estadística Computacional
										<br />
										<input name=asignaturas[] type='checkbox'>
										Ingeniería del Software y Práctica Profesional
										<br />
										<input name=asignaturas[] type='checkbox'>
										Integración de Sistemas Físicos e Informáticos
										<br />
										<input name=asignaturas[] type='checkbox'>
										Optimización de Sistemas
										<br />
										<input name=asignaturas[] type='checkbox'>
										Procesamiento de Imágenes Digitales
										<br />
										<input name=asignaturas[] type='checkbox'>
										Seguridad en Sistemas Informáticos y en Internet
										<br />
										<input name=asignaturas[] type='checkbox'>
										Teledetección
										<br />
										<input name=asignaturas[] type='checkbox'>
										Trabajo Fin de Grado
										<br />
									</div>
								</div>
								<br />	
								<label for="pass">Contraseña:</label>
									<input type="password" id="pass" name="pass">
								<br />
								<label for="passConf">Confirmar contraseña:</label>
									<input type="password" id="passConf" name="passConf">
								<br />
							</fieldset>
							<div class='clear'></div>
							<div class='alinearCentro'>
								<input class="enviarProf" type="submit" value="Confirmar" formaction="accionInsertarProfesorAdmin.php"onclick="InsertarProfesor();" />
							</div>
						</form>
					</div>
				</div>	
			</article>
			
		</main>
		<div class='clear'></div>

		<!--Pie-->
		<?php include_once ('includes/pie.php'); ?>
	</body>
</html>