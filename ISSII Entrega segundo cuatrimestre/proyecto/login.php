<?php
//Inicio de sesiones
session_start();

//Includes
include_once ('includes/funciones.php');

//Elimino la sesión de DNI en el caso de que exista
unset($_SESSION['DNI']);

//Se comprueba si existe en sesión algún error y en tal caso se mete en la variable $errores
if (isset($_SESSION['errores'])) {
	$errores = $_SESSION['errores'];
}

//Se comprueba si existe en sesión algún usuario y contraseña, y en tal caso se mete en la variable $usuario y $contrasenia
if (isset($_SESSION['user']) && isset($_SESSION['contrasenia'])) {
	$usuario = $_SESSION['user'];
	$contrasenia = $_SESSION['contrasenia'];
}

//Botón del menú que estará on
$menuBoton_on = 1;

?>

<!DOCTYPE HTML>

<html lang='es'>
	<head>
		<title>Login</title>
		<meta charset='utf-8' />
		<meta name='viewport' content='width=device-width, initial-scale=1.0' />
		<link rel='shortcut icon' type='image/x-icon' href='img/favicon.ico'>
		<link rel='stylesheet' type='text/css' href='css/general.css' />
		<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js'></script>
		<script type="text/javascript" src="js/funcionesJQuery.js"></script>
		<script>
			//Función para cambiar la imagen del botón de enviar a activo
			function cambiaImg() {
				$('#enviar').attr('src', 'img/varios/entrarActivo.png');
			}
			
			//Función para cambiar la imagen del botón de enviar a la original
			function imgOriginal() {
				$('#enviar').attr('src', 'img/varios/entrar.png');
			}
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
				<div class="contenedor recuadro paddingsEspacios">
					<br />
					<section class="col-100 tablet-100 movil-100">
						<h1 class="alinearCentro">Inicio sesión</h1>
					</section>
					<div class="col-100 tablet-col-100 movil-col-100 alinearCentro">
					<br />
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
					?><br />
						<form id='formulario' action='controladorLogin.php' method='POST'>
							<fieldset class='inicio'>
								<label for="usuario">Usuario</label></br>
									<input <?php if(isset($errores) && empty($usuario)){ ?>class='userFallo'<?php }?> id='user' name='DNI' type='text' value='<?php if (!empty($usuario)) { echo $usuario; }?>' /><br /></br>
								<label for="contraseña">Contraseña</label></br>
									<input <?php if(isset($errores) && empty($contrasenia)){ ?>class='passFallo'<?php }?> id='pass' name='pass' onkeypress='isMayus(event);' type='password' value='<?php if (!empty($usuario)) { echo $contrasenia; }?>' /></br>
								<div class='mayus' style='display:none'>
									<p>El block mayus está activado</p>
								</div><br/>
								<input id='enviar' name='enviar' type='image' onmouseout='imgOriginal()' onmouseover='cambiaImg()' src='img/varios/entrar.png' width='50' height='50' />
							</fieldset>
						</form>
					</div>
				</div>
			</article>
			<div class="clear"></div>
		</main>

		<div class="clear"></div>

		<!--Pie-->
		<?php include_once ('includes/pie.php'); ?>
	</body>
</html>
