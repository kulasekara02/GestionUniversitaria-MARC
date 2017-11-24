<?php
/* Función para obtener un alumno dado su DNI.
 ========================================================================== */
function nombreAlumno($DNI, $conexion) {
	try {
		$stmt = $conexion -> prepare('SELECT NOMBRE, APELLIDOS FROM ALUMNOS WHERE DNI = :DNI');
		$stmt -> bindParam(':DNI', $DNI);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para obtener la información de un Alumno.
 ========================================================================== */
function getInfoAlumno($conexion, $DNI) {
	try {
		$stmt = $conexion -> prepare('SELECT Nombre, Apellidos, Sexo, Telefono, Direccion, Provincia, Codigo_postal, Modalidad, Forma_Acceso, Estado_Beca, Fecha_Nacimiento, Email FROM Alumnos WHERE DNI = :DNI');
		$stmt -> bindParam(":DNI", $DNI);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para obtener el grupo de un alumno.
 ========================================================================== */
function getGrupoAlumno($conexion, $DNI) {
	try {
		$stmt = $conexion -> prepare('SELECT OID_Grup FROM AlumnosPertenecenAGrupos WHERE DNI = :DNI');
		$stmt -> bindParam(":DNI", $DNI);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para obtener el nombre de un grupo.
 ========================================================================== */
function getNombreGrupo($conexion, $oid_grup) {
	try {
		$stmt = $conexion -> prepare('SELECT Nombre FROM Grupos WHERE OID_Grup = :oid_grup');
		$stmt -> bindParam(":oid_grup", $oid_grup);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para obtener el codigo de una matrícula.
 ========================================================================== */
function getCodigoMatricula($conexion, $DNI) {
	try {
		$stmt = $conexion -> prepare('SELECT Codigo_Matric FROM Matriculas WHERE DNI=:DNI');
		$stmt -> bindParam(":DNI", $DNI);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para obtener las asignaturas de un alumno.
 ========================================================================== */
function getAsignaturaAlumno($conexion, $codigo_asig) {
	try {
		$stmt = $conexion -> prepare('SELECT Nombre, Curso, Tipo, Creditos FROM Asignaturas WHERE Codigo_Asig=:codigo_asig');
		$stmt -> bindParam(":codigo_asig", $codigo_asig);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para obtener el grado de un alumno.
 ========================================================================== */
function getGradoAlumno($conexion, $DNI) {
	try {
		$codigo_matric = getCodigoMatricula($conexion, $DNI);
		$stmt = $conexion -> prepare('SELECT OID_G FROM MatriculasPertenecenAGrados WHERE Codigo_Matric = :codigo_matric');
		$stmt -> bindParam(":codigo_matric", $codigo_matric['CODIGO_MATRIC']);
		$stmt -> execute();
		return $stmt -> fetchColumn();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para obtener los códigos de matrículas de un alumno.
 ========================================================================== */
function getMatriculas($conexion, $usuario) {
	try {
		$stmt = $conexion -> prepare("SELECT Codigo_Matric FROM Matriculas WHERE DNI = :dni");
		$stmt -> bindparam(":dni", $usuario['dni']);
		$stmt -> execute();
		return $stmt;
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}



/* Función para Eliminar un Alumno.
 ========================================================================== */
function eliminarAlumno($conexion, $DNI) {
	try {
		$stmt = $conexion -> prepare("DELETE ALUMNOS WHERE DNI = :DNI ");
		$stmt -> bindparam(":DNI", $DNI);
		$stmt -> execute();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para mostrar todos los Alumnos
 ========================================================================== */
function mostrarAlumnos($conexion) {
	$consulta = "SELECT DNI, NOMBRE, APELLIDOS FROM Alumnos";
	return $conexion -> query($consulta);
}

/* Función para consultar alumnos por búsqueda
 ========================================================================== */
function consultarAlumnos($conexion, $busqueda) {
	$etiquetas = ucwords($busqueda);
	$etiquetas = trim($etiquetas);
	$consulta = "SELECT NOMBRE,APELLIDOS FROM ALUMNOS WHERE UPPER(TRANSLATE(NOMBRE, 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU')) LIKE UPPER(TRANSLATE('%$etiquetas%', 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU'))" . "OR DNI IN (SELECT DNI FROM PROFESORESIMPARTENASIGNATURAS WHERE CODIGO_ASIG IN (SELECT CODIGO_ASIG FROM ASIGNATURAS WHERE" . " UPPER(TRANSLATE(NOMBRE, 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU')) LIKE UPPER(TRANSLATE('%$etiquetas%', 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU'))))" . "OR OID_DEP IN (SELECT OID_DEP FROM DEPARTAMENTOS WHERE " . " UPPER(TRANSLATE(NOMBRE, 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU')) LIKE UPPER(TRANSLATE('%$etiquetas%', 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU')))";
	return $conexion -> query($consulta);
}

/* Función para modificar el nombre de un Alumno.
 ========================================================================== */
function modificarNombreAlum($conexion, $DNI, $nombre) {
	try {
		$stmt = $conexion -> prepare("UPDATE Alumnos SET Nombre = :Nombre WHERE DNI = :DNI ");
		$stmt -> bindparam(":Nombre", $nombre);
		$stmt -> bindparam(":DNI", $DNI);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para modificar los Apellidos de un Alumnos.
 ========================================================================== */
function modificarApellidosAlum($conexion, $DNI, $apellidos) {
	try {
		$stmt = $conexion -> prepare("UPDATE Alumnos SET Apellidos = :Apellidos WHERE DNI = :DNI ");
		$stmt -> bindparam(":Apellidos", $apellidos);
		$stmt -> bindparam(":DNI", $DNI);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para modificar el Email de un Alumnos.
 ========================================================================== */
function modificarEmailAlum($conexion, $DNI, $email) {
	try {
		$stmt = $conexion -> prepare("UPDATE Alumnos SET Email = :Email WHERE DNI = :DNI ");
		$stmt -> bindparam(":Email", $email);
		$stmt -> bindparam(":DNI", $DNI);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para modificar el Fecha_Nacimiento de un Alumnos.
 ========================================================================== */
function modificarFecha_NacimientoAlum($conexion, $DNI, $fecha) {
	try {
		$stmt = $conexion -> prepare("UPDATE Alumnos SET Fecha_Nacimiento = :Fecha_Nacimiento WHERE DNI = :DNI ");
		$stmt -> bindparam(":Fecha_Nacimiento", $fecha);
		$stmt -> bindparam(":DNI", $DNI);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}
/* Función para modificar el Telefono de un Alumnos.
 ========================================================================== */
function modificarTelefonoAlum($conexion, $DNI, $telefono) {
	try {
		$stmt = $conexion -> prepare("UPDATE Alumnos SET Telefono = :Telefono WHERE DNI = :DNI ");
		$stmt -> bindparam(":Telefono", $telefono);
		$stmt -> bindparam(":DNI", $DNI);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}
/* Función para modificar el Direccion de un Alumnos.
 ========================================================================== */
function modificardireccionAlum($conexion, $DNI, $direccion) {
	try {
		$stmt = $conexion -> prepare("UPDATE Alumnos SET Direccion = :Direccion WHERE DNI = :DNI ");
		$stmt -> bindparam(":Direccion", $direccion);
		$stmt -> bindparam(":DNI", $DNI);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}
/* Función para modificar el CPostal de un Alumnos.
 ========================================================================== */
function modificarCodigo_postalAlum($conexion, $DNI, $CPostal) {
	try {
		$stmt = $conexion -> prepare("UPDATE Alumnos SET Codigo_postal = :Codigo_postal WHERE DNI = :DNI ");
		$stmt -> bindparam(":Codigo_postal", $CPostal);
		$stmt -> bindparam(":DNI", $DNI);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}
/* Función para modificar el Provincia de un Alumnos.
 ========================================================================== */
function modificarprovinciaAlum($conexion, $DNI, $Provincia) {
	try {
		$stmt = $conexion -> prepare("UPDATE Alumnos SET Provincia = :Provincia WHERE DNI = :DNI ");
		$stmt -> bindparam(":Provincia", $Provincia);
		$stmt -> bindparam(":DNI", $DNI);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}
?>