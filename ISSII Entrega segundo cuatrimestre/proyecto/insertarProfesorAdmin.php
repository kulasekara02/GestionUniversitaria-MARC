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
	$formulario['asignaturas'] = array();
	$_SESSION['formulario'] = $formulario;
}
else{
	$formulario = $_SESSION['formulario'];
}
	
//Se comprueba si existe en sesión algún error y en tal caso se mete en la variable $errores
if (isset($_SESSION['errores'])) {
	$errores = $_SESSION['errores'];
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

//Se obtienen todos los departamentos

$departamentos = getDepartamentos($conexion);

cerrarConexionBD($conexion);
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
		<main class='contenedor matriculacion'>	<!--El estilo de formulario de matriculacion es el mismo-->
			<article class='col-100 tablet-col-100 movil-col-100'>
				<br /><br />
				<h1 class='alinearCentro titulillo'>Insertar Profesor</h1>
					</section>
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
									<input id='fecha' name='fecha' type=<?php if(strpos($user_agent, 'Firefox') !== FALSE){ echo 'text'; ?>	placeholder= 'DD/MM/YYYY' <?php } else{	echo 'date'; } ?> value="<?php echo $formulario["fecha"];?>" required /><br />
								<label for="departamento">Departamento:</label><br />
								<select class="dato" id="departamento" name="departamento" size="1" required>
									<?php foreach($departamentos as $departamento){
										echo "<option value='".$departamento["OID_DEP"]."'>".$departamento["NOMBRE"]."</option>";
									}
									
									?>
								
								</select>
								<br /><br /><br />
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
											<input name=asignaturas[] value="<?php echo $asig['CODIGO_ASIG']; ?>" <?php if( in_array($asig['CODIGO_ASIG'], array($formulario["asignaturas"]))) echo "checked"; ?> type='checkbox'>
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
											<input name=asignaturas[] value="<?php echo $asig['CODIGO_ASIG'];  ?>" <?php if( in_array($asig['CODIGO_ASIG'], array($formulario["asignaturas"]))) echo "checked";?> type='checkbox'>
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
											<input name=asignaturas[] value="<?php echo $asig['CODIGO_ASIG']; ?>" <?php if( in_array($asig['CODIGO_ASIG'], array($formulario["asignaturas"]))) echo "checked";?> type='checkbox'>
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
											<input name=asignaturas[] value="<?php echo $asig['CODIGO_ASIG']; ?>" <?php if( in_array($asig['CODIGO_ASIG'], array($formulario["asignaturas"]))) echo "checked";?> type='checkbox'>
											<?php echo $asig['NOMBRE']; ?>
											<br />
										<?php
										}
									} ?>
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
							<div class='clear'></div><br />
							<div class='alinearCentro'>
								<input class="enviarProf" type="submit" value="Confirmar" formaction="accionInsertarProfesorAdmin.php"onclick="InsertarProfesor();" />
							</div><br />
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