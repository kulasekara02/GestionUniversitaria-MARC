<?php
    /* Función para la creación del slider.
 ========================================================================== */
function crearSlider() {
	$imagenes = array(
		"img/banners/slide1.jpg",
		"img/banners/slide2.jpg",
		"img/banners/slide3.jpg",
		"img/banners/slide4.jpg"
	);
	foreach ($imagenes as $imagen) { ?>
		<section class="sliderSection">
			<img src="<?php echo $imagen; ?>" />
		</section>
	<?php 
	}
}

/* Función para obtener el tipo del usuario que entra en la página.
 ========================================================================== */
function tipoUsuario($conexion, $DNI) {
	try {
		$stmt = $conexion -> prepare("SELECT TipoUsuario FROM Usuarios WHERE DNI = :DNI");
		$stmt -> bindparam(':DNI', $DNI);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para la creación del menú tanto en la cabecera como en el pie.
 ========================================================================== */
function crearMenu($boton_on=0, $tipoMenu, $DNI=""){
	$id = "menuCabecera";
	$conexion = crearConexionBD();
	$tipoUsuario = tipoUsuario($conexion, $DNI);
	$admin = esAdministrador($conexion, $DNI);
	$alumno = getInfoAlumno($conexion, $DNI);
	$profesor = getInfoProfesor($conexion, $DNI);
	cerrarConexionBD($conexion);
	if($tipoUsuario["TIPOUSUARIO"] == 'Alumno'){
		$nombre = array(
			"Inicio",
			"Pedir tutoría",
			"Calendario",
			"Mis tutorias",
			"Mi perfil",
			"Deslogear [".$alumno['NOMBRE']." ".$alumno['APELLIDOS']."]"
		);
		$href = array(
			"index.php",
			"buscarProfesorPerfil.php",
			"calendario.php",
			"verTutoriasAlumno.php",
			"verAlumno.php",
			"logout.php"
		);
	} else if($tipoUsuario["TIPOUSUARIO"] == 'Profesor'){
		$nombre = array(
			"Inicio",
			"Tutorías recibidas",
			"Calendario",
			"Mi perfil"
		);
		$href = array(
			"index.php",
			"verTutoriasProfesor.php",
			"calendario.php",
			"editarPerfilProfesor.php"
		);
		if($admin["ESADMINISTRADOR"] == 1){
			array_push($nombre, "Introducir Profesor", "Editar Profesor", "Eliminar Profesor", "Editar Alumno", "Eliminar Alumno");
			array_push($href, "insertarProfesorAdmin.php", "buscarProfesorEditar.php", "buscarProfesorEliminar.php", "buscarAlumnoEditar.php", "buscarAlumnoEliminar.php");
		}
		array_push($nombre, "Deslogear [".$profesor['NOMBRE']." ".$profesor['APELLIDOS']."]");
		array_push($href, "logout.php");
	} else{
		$nombre = array(
			"Login",
			"Información",
			"Matriculación"
		);
		$href = array(
			"login.php",
			"informacion.php",
			"matriculacion.php"
		);
	}
	$numElementos = count($nombre);
	if($tipoMenu == 0){
		echo "<a href='#' id='desplegableMenu' class='esconderEnEscritorio' >MENÚ <img src='img/varios/icono_menu.png' alt='Menú' /></a>";
	} else{
		$id = "menuPie";
	} ?>
	<ul id=<?php echo $id; ?>>
		<?php
		for($i=0; $i < $numElementos; $i++){
			if($boton_on == ($i+1)){
				$class="boton_on";
			} else{
				$class="boton_off";
			} ?>
			<li class="<?php echo $class?>">
				<a href="<?php echo $href[$i]; ?>"><?php echo $nombre[$i]; ?></a>				
			</li>
		<?php
		} ?>
	</ul>
	<?php
}

/* Función para obtener la información un usuario.
 ========================================================================== */
function getInfoUsuario($conexion, $DNI) {
	try {
		$stmt = $conexion -> prepare("SELECT DNI, Pass FROM Usuarios WHERE DNI = :DNI");
		$stmt -> bindParam(":DNI", $DNI);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para obtener el valor de EsAdministrador de un usuario.
 ========================================================================== */

function esAdministrador($conexion, $DNI) {
	try {
		$stmt = $conexion -> prepare("SELECT EsAdministrador FROM Usuarios WHERE DNI = :DNI");
		$stmt -> bindparam(':DNI', $DNI);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para validar el login.
 ========================================================================== */
function validacionLogin($conexion, $usuario) {
	$errores = array();
	$info = getInfoUsuario($conexion, $usuario['usuario']);
	if (empty($usuario['usuario'])) {
		$errores[] = 'El usuario está vacío.';
		unset($_SESSION['user']);
	} else if (empty($info['DNI'])) {
		$errores[] = 'El usuario no se encuentra registrado.';
	} else {
		$_SESSION['user'] = $usuario['usuario'];
	}
	if (empty($usuario['contrasenia'])) {
		$errores[] = 'La contraseña esta vacía.';
		unset($_SESSION['contrasenia']);
	} else if ($usuario['contrasenia'] != $info['PASS']) {
		$errores[] = 'La contraseña es incorrecta.';
	} else {
		$_SESSION['contrasenia'] = $usuario['contrasenia'];
	}
	return $errores;
}

/* Función para obtener una fecha con el formato de oracle
 ========================================================================== */
function getFechaFormateada($fecha) {
	$fecha = date('d/m/Y', strtotime($fecha));
	return $fecha;
}
/* Función para Eliminar un usuario
 ========================================================================== */
function eliminarUsuario($conexion, $DNI) {
	try {
		$stmt = $conexion -> prepare("DELETE USUARIOS WHERE DNI = :DNI ");
		$stmt -> bindparam(":DNI", $DNI);
		$stmt -> execute();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}
?>