<?php
//Inicio de sesiones
session_start();

//Includes
require_once ('includes/funciones.php');

//Si no existen datos del formulario en la sesión, se crea una entrada con valores por defecto y se meten en la sesión, en caso contrario se meten los datos de la sesión en la variable $formulario
if (!isset($_SESSION['formulario'])) {
	$formulario['dni'] = '';
	$formulario['sexo'] = '';
	$formulario['nombre'] = '';
	$formulario['apellidos'] = '';
	$formulario['email'] = '';
	$formulario['telefono'] = "";
	$formulario['fecha'] = '';
	$formulario['provincia'] = '';
	$formulario['direccion'] = '';
	$formulario['cpostal'] = '';
	$formulario['curso'] = '';
	$formulario['acceso'] = '';
	$formulario['modalidad'] = '';
	$formulario['becas'] = '';
	$formulario['asignaturas'] = array();
	$_SESSION['formulario'] = $formulario;
}
else{
	$formulario = $_SESSION['formulario'];
}
	


//Se crea una conexión a la base de datos
$conexion = crearConexionBD();

//Se obtienen las asignaturas llamando a la función 'getAsignaturas'
$asignaturas1 = getAsignaturas($conexion);
$asignaturas2 = getAsignaturas($conexion);
$asignaturas3 = getAsignaturas($conexion);
$asignaturas4 = getAsignaturas($conexion);

//Se cierra la conexión a la base de datos
cerrarConexionBD($conexion);


//Variable para obtener el cliente desde el que está accediendo el usuario
$user_agent = $_SERVER['HTTP_USER_AGENT'];

//Botón del menú que estará on
$menuBoton_on = 3;

?>
<!DOCTYPE HTML>
<html lang='es'>
	<head>
		<title>Matriculación</title>
		<meta charset='utf-8' />
		<meta name='viewport' content='width=device-width, initial-scale=1.0' />
		<link rel='shortcut icon' type='image/x-icon' href='img/favicon.ico'>
		<link rel='stylesheet' type='text/css' href='css/general.css' />
		<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js'></script>
		<!--<script src="https://code.jquery.com/jquery-3.1.1.min.js" type="text/javascript"></script>-->
		<script type='text/javascript' src='js/funcionesJQuery.js'></script>
		<script>
			$(document).ready(function() {
				desplegarAsignaturas();
				matriculacion();
				$(".asignaturas").css("display","none");
				colorContraseña();
			});
		</script>
	</head>
	<body>
		<!--Cabecera-->
		<?php include_once ('includes/cabecera.php'); ?>

		<!--Menú-->
		<?php include_once ('includes/menu.php'); ?>
		
		<!--Contenido principal-->
		<main class='contenedor matriculacion paddingsEspacios'>
			<article class='col-100 tablet-col-100 movil-col-100'>
					<section class='col-100 tablet-100 movil-100'>
						<h1 class='alinearCentro titulillo'>Matriculación</h1>
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
									unset($_SESSION['errores']);
									
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
					<form target='_blank' id='formulario' method='POST'>
						<div >
							<fieldset class='dp'>
								<legend>Datos personales</legend>
								<label for='nombre'>Nombre:</label>
									<input id='nombre' name='nombre' type='text' value="<?php echo $formulario["nombre"];?>" required />
								<label for='sexo'>Sexo:</label> 
									<span>Hombre</span> <input id='hombre' name='sexo' value="Hombre" type='radio' <?php if( $formulario["sexo"]=="Hombre" || $formulario["sexo"]!="Mujer") echo "checked";?> />
									<span>Mujer</span> <input id='mujer' name='sexo' value="Mujer" type='radio' <?php if($formulario["sexo"]=="Mujer") echo "checked";?> /><br />
								<label for='apellidos'>Apellidos:</label>
									<input id='apellidos' name='apellidos' type='text' value="<?php echo $formulario["apellidos"];?>"  required /><br />
								<label for='telefono'>Teléfono:</label>
									<input id='telefono' name='telefono' type='text' value="<?php echo $formulario["telefono"];?>"  required />
								<label for='dni'>DNI/NIF:</label>
									<input id='dni' name='dni' type='text' value="<?php echo $formulario["dni"];?>"  required /><br />
								<label for='email'>Correo electrónico:</label>
									<input id='email' name='email' type='text' value="<?php echo $formulario["email"];?>" required /><br />
								<label for='fecha'>Fecha de nacimiento:</label>
									<input id='fecha' name='fecha' type=<?php if(strpos($user_agent, 'Firefox') !== FALSE){ echo 'text'; ?>	placeholder= 'DD/MM/YYYY' <?php } else{	echo 'date'; } ?> value="<?php echo $formulario["fecha"];?>" required /><br />
								<label for='direccion'>Dirección:</label>
									<input id='direccion' name='direccion' type='text' value="<?php echo $formulario["direccion"];?>"  required /><br />
								<label for='provincia'>Provincia:</label>
									<input id='provincia' list='opcionesProvincias' name='provincia' />
										<datalist id='opcionesProvincias'>
											<option label='Almería' value='Almería' <?php if($formulario["provincia"]=="Almería") echo "selected";?> ></option>
											<option label='Cádiz' value='Cádiz' <?php if($formulario["provincia"]=="Cádiz") echo "selected";?> ></option>
											<option label='Córdoba' value='Córdoba' <?php if($formulario["provincia"]=="Córdoba") echo "selected";?> ></option>
											<option label='Granada' value='Granada' <?php if($formulario["provincia"]=="Granada") echo "selected";?> ></option>
											<option label='Huelva' value='Huelva' <?php if($formulario["provincia"]=="Huelva") echo "selected";?> ></option>
											<option label='Jaén' value='Jaén' <?php if($formulario["provincia"]=="Jaén") echo "selected";?> ></option>
											<option label='Málaga' value='Málaga' <?php if($formulario["provincia"]=="Málaga") echo "selected";?> ></option>
											<option label='Sevilla' value='Sevilla' <?php if($formulario["provincia"]=="Sevilla") echo "selected";?> ></option>
										</datalist>
								<label for='cpostal'>Código postal:</label>
									<input id='cpostal' name='cpostal' type='text' value="<?php echo $formulario["cpostal"];?>" required />
							</fieldset>
						</div>
						<div >
							<fieldset id='dacd'>
								<legend>Datos académicos</legend>
								<label for='curso'>Curso:</label>
								<select class='curso' id='curso' name='curso' size='1' required>
									<option value='0'>Seleccionar</option>
									<option value='1' <?php if($formulario["curso"]==1) echo "selected";?> >1</option>
									<option value='2' <?php if($formulario["curso"]==2) echo "selected";?> >2</option>
									<option value='3' <?php if($formulario["curso"]==3) echo "selected";?> >3</option>
									<option value='4' <?php if($formulario["curso"]==4) echo "selected";?> >4</option>
								</select>
								<label for='modalidad'>Modalidad:</label>
								<span>Español</span> <input id='esp' name='modalidad' value="Español" type='radio' <?php if($formulario["modalidad"]=="Español" || $formulario["modalidad"]!="Inglés") echo "checked";?> />
								<span>Inglés</span> <input id='eng' name='modalidad' value="Inglés" type='radio' <?php if($formulario["modalidad"]=="Inglés") echo "checked";?>/> <br />
								<div class="asignaturas">
								<label class ='asignaturas' for='asignaturas'>Asignaturas:</label><br />
								<div class='asigs1'>
								<b>Primer curso:</b><br />
									<?php
									foreach($asignaturas1 as $asig){ 
										if($asig['CURSO'] == 1){ ?>
											<input class="asignaturasCheck" name=asignaturas[] value="<?php echo $asig['CODIGO_ASIG']; ?>" <?php if( in_array($asig['CODIGO_ASIG'], array($formulario["asignaturas"]))) echo "checked"; ?> type='checkbox'>
											<?php echo $asig['NOMBRE']; ?>
											<br />
										<?php
										}
									} ?>
								</div>
								<div class='asigs2'>
									<b>Segundo curso:</b><br />
									<?php
									foreach($asignaturas2 as $asig){ 
										if($asig['CURSO'] == 2){ ?>
											<input class="asignaturasCheck" name=asignaturas[] value="<?php echo $asig['CODIGO_ASIG'];  ?>" <?php if( in_array($asig['CODIGO_ASIG'],array($formulario["asignaturas"])))echo "checked";?> type='checkbox'>
											<?php echo $asig['NOMBRE']; ?>
											<br />
										<?php
										}
									} ?>
								</div>
								<div class='asigs3'>
									<b>Tercer curso:</b><br />
									<?php
									foreach($asignaturas3 as $asig){ 
										if($asig['CURSO'] == 3){ ?>
											<input class="asignaturasCheck" name=asignaturas[] value="<?php echo $asig['CODIGO_ASIG']; ?>" <?php if( in_array($asig['CODIGO_ASIG'], array($formulario["asignaturas"]))) echo "checked"; ?> type='checkbox'>
											<?php echo $asig['NOMBRE']; ?>
											<br />
										<?php
										}
									} ?>
								</div>
								<div class='asigs4'>
									<b>Cuarto curso:</b><br />
									<?php
									foreach($asignaturas4 as $asig){ 
										if($asig['CURSO'] == 4){ ?>
											<input class="asignaturasCheck" name=asignaturas[] value="<?php echo $asig['CODIGO_ASIG']; ?>" <?php if(in_array($asig['CODIGO_ASIG'], array($formulario["asignaturas"]))) echo "checked"; ?> type='checkbox'>
											<?php echo $asig['NOMBRE'] ;?>
											<br />
										<?php
										}
									} ?>
								</div>
								</div>
								<?php  ?>
								<label for='acceso'>Forma de acceso:</label>
									<select class='acceso' id='acceso' name='acceso' size='1' required>
										<option value='0'>Seleccionar</option>
										<option value='1'  <?php if($formulario["acceso"]== getNombreFormaAcceso("1")) echo "selected";?> >Estudios Postobligatorios</option>
										<option value='2'  <?php if($formulario["curso"]== getNombreFormaAcceso("2")) echo "selected";?>>Ciclo Formativo de Grado Medio</option>
										<option value='3'  <?php if($formulario["curso"]== getNombreFormaAcceso("3")) echo "selected";?>>Ciclo Formativo de Grado Superior</option>
										<option value='4'  <?php if($formulario["curso"]== getNombreFormaAcceso("4")) echo "selected";?>>Grado</option>
										<option value='5'  <?php if($formulario["curso"]== getNombreFormaAcceso("5")) echo "selected";?>>Mayores de 25 años</option>
										<option value='6'  <?php if($formulario["curso"]== getNombreFormaAcceso("6")) echo "selected";?>>Mayores de 45 años</option>
										<option value='7'  <?php if($formulario["curso"]== getNombreFormaAcceso("7")) echo "selected";?>>Otros</option>
									</select><br />
								<label for='becas'>Becas y subvenciones:</label><br />
									<input name='becas' value='No soy becario' type='radio' checked> <b>No soy becario</b>
									<input name='becas' value='Becario MEC' type='radio'><span>Becario MEC</span>
									<input name='becas' value='Deportista alto riesgo' type='radio'><span>Deportista alto riesgo</span>
									<input name='becas' value='Discapacitados' type='radio'><span>Discapacitados</span><br />
							</fieldset>
						</div>
						<div >
							<fieldset>
								<legend>Confirmación</legend>
								<p>Está a punto de terminar el proceso de matriculación en la Universidad de Sevilla. Al matricularse, podrá
								acceder a la plataforma de tutorías de la universidad. Para ello debe escoger una contraseña, Su nombre de usuario
								vendrá dado por su número de DNI.<br /><br />
								Para ver su matrícula, pulse el botón 'Ver matrícula'. Si desea modificar algún campo, pulse volver atrás.
								Si todos los datos son correctos y ya ha introducido su contraseña, por favor proceda a confirmar la matrícula.</p><br />
								<label for='pass'>Contraseña:</label>
									<input type='password' id='pass' name='pass'><br />
								<label for='passConf'>Confirmar contraseña:</label>
									<input type='password' id='passConf' name='passConf'><br />
								
							</fieldset>
						</div>
						<div class='alinearCentro'>
							<input class='ver' name="ver" formaction="verMatricula.php" type='submit' value='Ver matrícula' >
							<input class='enviar' name="enviar" formaction="accionAltaMatricula.php"  type='submit' value='Confirmar'>
						</div>
					</form>
			</article>
			<div class='clear'></div>
			
		</main>
		<div class='clear'></div>

		<!--Pie-->
		<?php include_once ('includes/pie.php'); ?>
	</body>
</html>