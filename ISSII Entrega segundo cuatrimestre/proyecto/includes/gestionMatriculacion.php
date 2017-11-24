<?php
/* Función para obtener la forma de acceso al matricularse
 ========================================================================== */
function getFormaAcceso($abr) {
	$acceso = array('1' => 'Estudios Postobligatorios',
					'2' => 'Ciclo Formativo de Grado Superior',
					'3' => 'Ciclo Formativo de Grado Medio',
					'4' => 'Grado',
					'5' => 'Mayores de 25 años',
					'6' => 'Mayores de 45 años',
					'7' => 'Otros');
	if (isset($acceso[$abr])) {
		return $acceso[$abr];
	} else {
		return 'Error';
	}
}
/* Función para obtener todas las asignaturas
 ========================================================================== */
function getAsignaturas($conexion) {
	try {
		$stmt = $conexion -> prepare('SELECT Codigo_Asig, Nombre, Acronimo, Creditos, Periodo, Curso, Tipo FROM Asignaturas');
		$stmt -> execute();
		return $stmt;
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}
/*Funcion para formatear fecha*/
function formatearFecha($fecha){
	
	if(strrpos($fecha,"-")==false){
	  $partesFecha = explode("/", $fecha);
	  return "".$partesFecha[2].'-'.$partesFecha[1].'-'.$partesFecha[0]."";
	 }else{
	 	return $fecha;
	 }
}
/* Función para validar la matriculación.
 ========================================================================== */
function validacionMatriculacion($usuario) {
	$errores = array();
	
	$numeroDNI = substr($usuario["dni"], 0,8);
	$letra = substr($usuario["dni"],-1);
	
	if ($usuario["dni"] == "") {
		$errores[] = "El DNI no puede estar vacío";
	} else if (!preg_match("/^[0-9]{8}[A-Z]$/", $usuario["dni"])) {
		$errores[] = "El DNI debe contener 8 números y una letra mayúscula: " . $usuario["dni"] . "";
	}else if($letra != letraDNI($numeroDNI)){
		$errores[] = "El DNI debe contener la letra adecuada: " . $usuario["dni"] . "";
	}
	if ($usuario["sexo"] != "Mujer" && $usuario["sexo"] != "Hombre") {
		$errores[] = "El sexo debe ser Hombre o Mujer " ;
	}
	if ($usuario["modalidad"] != "Español" && $usuario["modalidad"] != "Inglés") {
		$errores[] = "La modalidad debe ser español o inglés.".$usuario["modalidad"]."";
	}
	if ($usuario["nombre"] == "" || !preg_match("/^[A-Za-záéíóúÁÉÍÓÚ\s]+$/", $usuario["nombre"])) {
		$errores[] = "El nombre no puede estar vacío o no ser alfabetico";
	}
	if ($usuario["apellidos"] == "" || !preg_match("/^[A-Za-záéíóúÁÉÍÓÚ\s]+$/", $usuario["apellidos"]) ) {
		$errores[] = "Los apellidos no puede estar vacío o no ser alfabeticos";
	}
	if ($usuario["email"] == "") {
		$errores[] = "El email no puede estar vacío";
	} else if (filter_var($usuario["email"], FILTER_VALIDATE_EMAIL) == false) {
		$errores[] = "El email es incorrecto: " . $usuario["email"] . "";
	}else if(!preg_match("/^([a-zA-Z0-9_\.\-])+\@alum.es+$/", $usuario["email"])){
		$errores[] = "El email debe acabar en @alum.es: " . $usuario["email"] . "";
	}
	if ($usuario["telefono"] == "" or !is_numeric($usuario["telefono"]) or strlen($usuario["telefono"]) < 9) {
		$errores[] = "El teléfono no es correcto";
	}
	if ($usuario["fecha"] == ""){
		$errores[] = "La fecha de nacimiento no puede estar vacía";
	} else if (strtotime(formatearFecha($usuario["fecha"])) >= strtotime(date("Y-m-d"))) {
		$errores[] = "La fecha de nacimiento es incorrecta". formatearFecha($usuario["fecha"])."";
		
	} else if ( strtotime(date("Y-m-d")) - strtotime(formatearFecha($usuario["fecha"]))< 568024200) {
		$errores[] = "Debes ser mayor de 18 años ". formatearFecha($usuario["fecha"])."";
	}
	if ($usuario["provincia"] != "Almería" && $usuario["provincia"] != "Cádiz" && $usuario["provincia"] != "Córdoba" && $usuario["provincia"] != "Granada" && $usuario["provincia"] != "Huelva" && $usuario["provincia"] != "Jaén" && $usuario["provincia"] != "Sevilla" && $usuario["provincia"] != "Málaga" || $usuario["provincia"] == "") {
		$errores[] = "Provincia erronea";
	}
	if ($usuario["cpostal"] == "" or !is_numeric($usuario["cpostal"]) || strlen($usuario["cpostal"]) != 5) {
		$errores[] = "El cpostal no es válido.";
	}
	if ($usuario["curso"] == 0) {
		$errores[] = "Debes seleccionar un curso.";
	}
	if ($usuario['asignaturas'] == ""){
		$errores[] = "Debes seleccionar al menos una asignatura.";
	}
	if ($usuario["acceso"] == "") {
		$errores[] = "Debes seleccionar una forma de acceso.";
	}
	if (!isset($usuario["pass"]) || strlen($usuario["pass"]) < 8) {
		$errores[] = "Contraseña no válida: debe tener al menos 8 caracteres";
	} else if (!preg_match("/[a-z]+/", $usuario["pass"]) || !preg_match("/[A-Z]+/", $usuario["pass"]) || !preg_match("/[0-9]+/", $usuario["pass"])) {
		$errores[] = "Contraseña no válida: debe contener letras mayúsculas y minúsculas y dígitos";
	} else if ($usuario["pass"] != $usuario["passConf"]) {
		$errores[] = "La confirmación de contraseña no coincide con la contraseña";
	}
	return $errores;
}
//Funcion para calcular la letra del DNI

function letraDNI($numeroDNI){
	$numero = $numeroDNI%23;
	$letra = "";
	switch ($numero) {
		case 0:
			$letra = "T";
			break;
		case 1:
			$letra = "R";
			break;
		case 2:
			$letra = "W";
			break;
		case 3:
			$letra = "A";
			break;
		case 4:
			$letra = "G";
			break;
		case 5:
			$letra = "M";
			break;
		case 6:
			$letra = "Y";
			break;
		case 7:
			$letra = "F";
			break;
		case 8:
			$letra = "P";
			break;
		case 9:
			$letra = "D";
			break;
		case 10:
			$letra = "X";
			break;
		case 11:
			$letra = "B";
			break;
		case 12:
			$letra = "N";
			break;
		case 13:
			$letra = "J";
			break;
		case 14:
			$letra = "Z";
			break;
		case 15:
			$letra = "S";
			break;
		case 16:
			$letra = "Q";
			break;
		case 17:
			$letra = "V";
			break;
		case 18:
			$letra = "H";
			break;
		case 19:
			$letra = "L";
			break;
		case 20:
			$letra = "C";
			break;
		case 21:
			$letra = "K";
			break;
		case 22:
			$letra = "E";
			break;
		
	}
	
	return $letra;
}
/* Función para validar la insercción de un profesor.
 ========================================================================== */
function validacionInsertarProfesor($usuario) {
	$errores = array();
	if ($usuario["dni"] == "") {
		$errores[] = "El DNI no puede estar vacío";
	} else if (!preg_match("/^[0-9]{8}[A-Z]$/", $usuario["dni"])) {
		$errores[] = "El DNI debe contener 8 números y una letra mayúscula: " . $usuario["dni"] . "";
	}
	  if ($usuario["nombre"] == "" || !preg_match("/^[A-Za-záéíóúÁÉÍÓÚ\s]+$/", $usuario["nombre"])) {
        $errores[] = "El nombre no puede estar vacío o no ser alfabetico";
    }
    if ($usuario["apellidos"] == "" || !preg_match("/^[A-Za-záéíóúÁÉÍÓÚ\s]+$/", $usuario["apellidos"]) ) {
        $errores[] = "Los apellidos no puede estar vacío o no ser alfabeticos";
    }
	if ($usuario["email"] == "") {
		$errores[] = "El email no puede estar vacío";
	} else if (filter_var($usuario["email"], FILTER_VALIDATE_EMAIL) == false) {
		$errores[] = $error . "El email es incorrecto: " . $usuario["email"] . "";
	}
	if ($usuario["fecha"] == ""){
		$errores[] = "La fecha de nacimiento no puede estar vacía";
	} else if (strtotime(formatearFecha($usuario["fecha"])) >= strtotime(date("Y-m-d"))) {
		$errores[] = "La fecha de nacimiento es incorrecta". formatearFecha($usuario["fecha"])."";
		
	} else if ( strtotime(date("Y-m-d")) - strtotime(formatearFecha($usuario["fecha"]))< 568024200) {
		$errores[] = "Debes ser mayor de 18 años ". formatearFecha($usuario["fecha"])."";
	}
	
	if (!isset($usuario["pass"]) || strlen($usuario["pass"]) < 8) {
		$errores[] = "Contraseña no válida: debe tener al menos 8 caracteres";
	} else if (!preg_match("/[a-z]+/", $usuario["pass"]) || !preg_match("/[A-Z]+/", $usuario["pass"]) || !preg_match("/[0-9]+/", $usuario["pass"])) {
		$errores[] = "Contraseña no válida: debe contener letras mayúsculas y minúsculas y dígitos";
	} else if ($usuario["pass"] != $usuario["passConf"]) {
		$errores[] = "La confirmación de contraseña no coincide con la contraseña";
	}
	if ($usuario["curso"]=="") {
		$errores[] = "El curso no puede estar vacío";
	}
	if ($usuario["oid_d"] == "") {
		$errores[] = "El despacho no puede estar vacío";
	}
	if ($usuario["oid_dep"] == "") {
		$errores[] = "El departamento no puede estar vacío";
	}
	if (!isset($usuario["pass"]) || strlen($usuario["pass"]) < 8) {
		$errores[] = "Contraseña no válida: debe tener al menos 8 caracteres";
	} else if (!preg_match("/[a-z]+/", $usuario["pass"]) || !preg_match("/[A-Z]+/", $usuario["pass"]) || !preg_match("/[0-9]+/", $usuario["pass"])) {
		$errores[] = "Contraseña no válida: debe contener letras mayúsculas y minúsculas y dígitos";
	} else if ($usuario["pass"] != $usuario["passConf"]) {
		$errores[] = "La confirmación de contraseña no coincide con la contraseña";
	}
	return $errores;
}

/* Función para dar de alta un alumno.
 ========================================================================== */
function alta_alumno($conexion, $usuario) {
	try {
		$fecha = date('d/m/Y', strtotime($usuario['fecha']));
		$stmt = $conexion -> prepare("INSERT INTO Alumnos (DNI, Nombre, Apellidos, Sexo, Telefono, Direccion, Provincia, Codigo_Postal, Modalidad, Forma_Acceso, Estado_Beca, Fecha_Nacimiento, Email) VALUES (:dni, :nombre, :apellidos, :sexo, :telefono, :direccion, :provincia, :codigo_Postal, :modalidad, :forma_Acceso, :estado_Beca, :fecha, :email)");
		$stmt -> bindParam(":dni", $usuario['dni']);
		$stmt -> bindParam(":nombre", $usuario['nombre']);
		$stmt -> bindParam(":apellidos", $usuario['apellidos']);
		$stmt -> bindParam(":sexo", $usuario['sexo']);
		$stmt -> bindParam(":telefono", $usuario['telefono']);
		$stmt -> bindParam(":direccion", $usuario['direccion']);
		$stmt -> bindParam(":provincia", $usuario['provincia']);
		$stmt -> bindParam(":codigo_Postal", $usuario['cpostal']);
		$stmt -> bindParam(":modalidad", $usuario['modalidad']);
		$stmt -> bindParam(":forma_Acceso", $usuario['acceso']);
		$stmt -> bindParam(":estado_Beca", $usuario['becas']);
		$stmt -> bindParam(":fecha", $fecha);
		$stmt -> bindParam(":email", $usuario['email']);
		$stmt -> execute();
		return true;
	} catch(PDOException $e) {
		$_SESSION['excepcion'] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para dar de alta una matricula.
 ========================================================================== */
function alta_matricula($conexion, $usuario) {
	try {
		$fecha = date('d/m/Y');
		$stmt = $conexion -> prepare("INSERT INTO Matriculas (Fecha, Curso, DNI) VALUES (:fecha, :curso, :dni)");
		$stmt -> bindParam(":fecha",$fecha);
		$stmt -> bindParam(":curso", $usuario['curso']);
		$stmt -> bindParam(":dni", $usuario['dni']);
		$stmt -> execute();
		return true;
	} catch(PDOException $e) {
		$_SESSION['excepcion'] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para insertar las asignaturas de una matrícula
 ========================================================================== */
function alta_asignaturasMatricula($conexion, $codigo_matric, $codigo_asig) {
	try {
		$stmt = $conexion -> prepare("INSERT INTO MatriculasContienenAsignaturas (Codigo_Matric, Codigo_Asig) VALUES (:codigo_matric, :codigo_asig)");
		$stmt -> bindParam(":codigo_matric", $codigo_matric);
		$stmt -> bindParam(":codigo_asig", $codigo_asig);
		$stmt -> execute();
		return true;
	} catch(PDOException $e) {
		$_SESSION['excepcion'] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para dar de alta un usuario. Alumno
 ========================================================================== */
function alta_usuario($conexion, $usuario) {
	try {
		$stmt = $conexion -> prepare("INSERT INTO USUARIOS (DNI, PASS, TIPOUSUARIO, ESADMINISTRADOR) VALUES (:dni, :pass, :tipoUsuario, :esAdmin)");
		$alumno = "Alumno";
		$esAdmin = "0";
		$stmt -> bindParam(":dni", $usuario["dni"]);
		$stmt -> bindParam(":pass", $usuario["pass"]);
		$stmt -> bindParam(":tipoUsuario", $alumno);
		$stmt -> bindParam(":esAdmin", $esAdmin);
		$stmt -> execute();
		return true;
	} catch(PDOException $e) {
		$_SESSION['excepcion'] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para obtener el nombre de un grado.
 ========================================================================== */
function getNombreGrado($conexion, $oid_g) {
	try {
		$stmt = $conexion -> prepare('SELECT Nombre FROM Grados WHERE OID_G = :oid_g');
		$stmt -> bindParam(":oid_g", $oid_g);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}
/* Función para obtener el nombre de la forma de acceso.
 ========================================================================== */
function getNombreFormaAcceso($formaAcceso) {
	
	$nombre="";
	if($formaAcceso=="1"){
		$nombre = "Estudios Postobligatorios";
	} else if($formaAcceso=="2"){
		$nombre = "Ciclo Formativo de Grado Medio";
	} else if($formaAcceso=="3"){
		$nombre = "Ciclo Formativo de Grado Superior";
	} else if($formaAcceso=="4"){
		$nombre = "Grado";
	} else if($formaAcceso=="5"){
		$nombre = "Mayores de 25 años";
	} else if($formaAcceso=="6"){
		$nombre = "Mayores de 45 años";
	} else if($formaAcceso=="7"){
		$nombre = "Otros";
	}
	return $nombre;
}

/* Función para obtener el codigo de las asignaturas.
 ========================================================================== */
function getCodigoAsignaturas($conexion, $DNI) {
	try {
		$codigo_matric = getCodigoMatricula($conexion, $DNI);
		$stmt = $conexion -> prepare('SELECT Codigo_Asig FROM MatriculasContienenAsignaturas WHERE Codigo_Matric=:codigo_matric');
		$stmt -> bindParam(":codigo_matric", $codigo_matric['CODIGO_MATRIC']);
		$stmt -> execute();
		return $stmt;
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}
?>