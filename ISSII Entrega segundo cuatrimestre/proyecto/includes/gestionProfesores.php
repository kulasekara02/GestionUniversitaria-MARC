<?php

/* Función para obtener un profesor dado su DNI.
 ========================================================================== */
function nombreProfesor($DNI, $conexion) {
	try {
		$stmt = $conexion -> prepare('SELECT NOMBRE, APELLIDOS FROM Profesores WHERE DNI = :DNI');
		$stmt -> bindParam(':DNI', $DNI);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para obtener el nombre del despacho.
 ========================================================================== */
function nombreDespacho($conexion, $oid_d) {
	try {
		$stmt = $conexion -> prepare("SELECT Nombre FROM Despachos WHERE OID_D = :OID_D");
		$stmt -> bindparam(":OID_D", $oid_d);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para obtener el nombre del departamento.
 ========================================================================== */
function nombreDepartamento($conexion, $oid_dep) {
	try {
		$stmt = $conexion -> prepare("SELECT Nombre FROM Departamentos WHERE OID_Dep = :OID_Dep");
		$stmt -> bindparam(":OID_Dep", $oid_dep);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para modificar el departamento de un profesor.
 ========================================================================== */
function modificarDepartamento($conexion, $DNI, $oid_dep) {
	try {
		$stmt = $conexion -> prepare("UPDATE PROFESORES SET OID_Dep = :OID_Dep WHERE DNI = :DNI ");
		$stmt -> bindparam(":OID_DEP", $oid_dep);
		$stmt -> bindparam(":DNI", $DNI);
		$stmt -> execute();
		return true;
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para modificar el despacho de un profesor.
 ========================================================================== */
function modificarDespacho($conexion, $DNI, $oid_d) {
	try {
		$stmt = $conexion -> prepare("UPDATE PROFESORES SET OID_D = :OID_D WHERE DNI = :DNI ");
		$stmt -> bindparam(":OID_D", $oid_d);
		$stmt -> bindparam(":DNI", $DNI);
		$stmt -> execute();	
		return true;
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}
/* Función para obtener todos los departamentos.
 ========================================================================== */
 function getDepartamentos($conexion) {
	try {
		$stmt = $conexion -> prepare("SELECT * FROM DEPARTAMENTOS");
		$stmt -> execute();
		return $stmt;
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para modificar la categoría de un profesor.
 ========================================================================== */
function modificarCategoria($conexion, $DNI, $categoria) {
	try {
		$stmt = $conexion -> prepare("UPDATE PROFESORES SET Categoria = :Categoria WHERE DNI = :DNI ");
		$stmt -> bindparam(":Categoria", $categoria);
		$stmt -> bindparam(":DNI", $DNI);
		$stmt -> execute();
		return true;
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para modificar el nombre de un profesor.
 ========================================================================== */
function modificarNombre($conexion, $DNI, $nombre) {
	try {
		$stmt = $conexion -> prepare("UPDATE PROFESORES SET Nombre = :Nombre WHERE DNI = :DNI ");
		$stmt -> bindparam(":Nombre", $nombre);
		$stmt -> bindparam(":DNI", $DNI);
		$stmt -> execute();
		return true;
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para modificar el Email de un profesor.
 ========================================================================== */
function modificarEmail($conexion, $DNI, $email) {
	try {
		$stmt = $conexion -> prepare("UPDATE PROFESORES SET Email = :Email WHERE DNI = :DNI ");
		$stmt -> bindparam(":Email", $email);
		$stmt -> bindparam(":DNI", $DNI);
		$stmt -> execute();
		return true;
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para modificar el Fecha_Nacimiento de un profesor.
 ========================================================================== */
function modificarFecha_Nacimiento($conexion, $DNI, $fecha) {
	try {
		$stmt = $conexion -> prepare("UPDATE PROFESORES SET Fecha_Nacimiento = :Fecha_Nacimiento WHERE DNI = :DNI ");
		$stmt -> bindparam(":Fecha_Nacimiento", $fecha);
		$stmt -> bindparam(":DNI", $DNI);
		$stmt -> execute();	
		return true;
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para modificar el dia de tutoria de un profesor.
 ========================================================================== */
function modificarDiaTutoria($conexion, $oid_h, $dia) {
	try {
		$stmt = $conexion -> prepare("UPDATE HorarioProfesores SET Dia = :dia WHERE OID_H = :OID_H ");
		$stmt -> bindparam(":dia", $dia);
		$stmt -> bindparam(":OID_H", $oid_h);
		$stmt -> execute();
		return true;
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para modificar el horario de tutorias de un profesor.
 ========================================================================== */

function modificarHorario($conexion, $oid_h, $hora_Inicio, $hora_Fin) {
	try {
		$stmt = $conexion -> prepare("UPDATE HorarioProfesores SET Hora_Comienzo_Tutoria = :hora_Inicio, Hora_Fin_Tutoria = :hora_Fin WHERE OID_H = :OID_H ");
		$stmt -> bindparam(":hora_Inicio", $hora_Inicio);
		$stmt -> bindparam(":hora_Fin", $hora_Fin);
		$stmt -> bindparam(":OID_H", $oid_h);
		$stmt -> execute();
		return true;
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para obtener la información de un profesor.
 ========================================================================== */
function getInfoProfesor($conexion, $DNI) {
	try {
		$stmt = $conexion -> prepare('SELECT Nombre , Apellidos, Fecha_Nacimiento, Email, Categoria, OID_D, OID_Dep FROM Profesores WHERE DNI = :DNI');
		$stmt -> bindParam(":DNI", $DNI);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para obtener la información de un profesor.
 ========================================================================== */
function getCursoAlumno($conexion, $DNI) {
	try {
		$stmt = $conexion -> prepare('SELECT Curso FROM Matriculas WHERE DNI = :DNI');
		$stmt -> bindParam(":DNI", $DNI);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para consultar profesores por búsqueda
 ========================================================================== */
function consultarProfesores($conexion, $busqueda) {
	$etiquetas = ucwords($busqueda);
	$etiquetas = trim($etiquetas);
	$consulta = "SELECT DNI, NOMBRE, APELLIDOS FROM PROFESORES WHERE UPPER(TRANSLATE(NOMBRE, 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU')) LIKE UPPER(TRANSLATE('%$etiquetas%', 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU'))" . "OR DNI IN (SELECT DNI FROM PROFESORESIMPARTENASIGNATURAS WHERE CODIGO_ASIG IN (SELECT CODIGO_ASIG FROM ASIGNATURAS WHERE" . " UPPER(TRANSLATE(NOMBRE, 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU')) LIKE UPPER(TRANSLATE('%$etiquetas%', 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU'))))" . "OR OID_DEP IN (SELECT OID_DEP FROM DEPARTAMENTOS WHERE " . " UPPER(TRANSLATE(NOMBRE, 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU')) LIKE UPPER(TRANSLATE('%$etiquetas%', 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU')))";
	return $conexion -> query($consulta);
}

/* Función para mostrar todos los profesores
 ========================================================================== */
function mostrarProfesores($conexion) {
	$consulta = "SELECT DNI, NOMBRE, APELLIDOS FROM PROFESORES";
	return $conexion -> query($consulta);
}

/* Función para obtener el oid de un despacho.
 ========================================================================== */
function getOIDDespacho($conexion, $despacho) {
	try {
		$stmt = $conexion -> prepare("SELECT OID_D FROM DESPACHOS WHERE NOMBRE = :nombre");
		$stmt -> bindparam(":nombre", $despacho);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para modificar los Apellidos de un profesor.
 ========================================================================== */
function modificarApellidos($conexion, $DNI, $apellidos) {
	try {
		$stmt = $conexion -> prepare("UPDATE PROFESORES SET Apellidos = :Apellidos WHERE DNI = :DNI ");
		$stmt -> bindparam(":Apellidos", $apellidos);
		$stmt -> bindparam(":DNI", $DNI);
		$stmt -> execute();
		return $stmt -> fetch();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para eliminar un horario de un profesor.
========================================================================== */
function eliminarHorario($conexion, $OID_H) {
	try {
		$stmt = $conexion -> prepare("DELETE FROM HORARIOPROFESORES WHERE OID_H = :OID_H");
		$stmt -> bindparam(":OID_H", $OID_H);
		$stmt -> execute();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para eliminar un horario de un profesor.
 ========================================================================== */
function aniadirHorarioTutoria($conexion, $horaInicio, $horaFin, $dia, $DNI) {
	try {
		$stmt = $conexion -> prepare("INSERT INTO HorarioProfesores (DNI, Hora_Comienzo_Tutoria, Hora_Fin_Tutoria, Dia) VALUES (:DNI, :hora_comienzo, :hora_fin, :dia)");
		$stmt -> bindparam(":DNI", $DNI);
		$stmt -> bindparam(":hora_comienzo", $horaInicio);
		$stmt -> bindparam(":hora_fin", $horaFin);
		$stmt -> bindparam(":dia", $dia);
		$stmt -> execute();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para Eliminar un profesor.
 ========================================================================== */
function eliminarProfesor($conexion, $DNI) {
	try {
		$stmt = $conexion -> prepare("DELETE PROFESORES WHERE DNI = :DNI ");
		$stmt -> bindparam(":DNI", $DNI);
		$stmt -> execute();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para obtener las asignaturas de un profesor.
 ========================================================================== */
function getAsignaturasProfesor ($conexion, $dni) {
	try {
		$stmt = $conexion -> prepare('SELECT Nombre, Acronimo, Creditos, Periodo, Tipo FROM Asignaturas NATURAL JOIN ProfesoresImpartenAsignaturas WHERE DNI = :DNI');
		$stmt -> bindParam(':DNI', $dni);
		$stmt -> execute();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
	return $stmt;
}

/* Función para dar de alta un Profesor.
========================================================================== */
function alta_profesor($conexion, $usuario) {
	try {
		$oiddep = getOIDDespacho($conexion, $usuario['oid_d']);
		$fecha = date('d/m/Y', strtotime($usuario['fecha']));
		$stmt = $conexion -> prepare("INSERT INTO Profesores (DNI, Nombre, Apellidos, Fecha_Nacimiento, Email,Categoria,OID_D,OID_Dep) VALUES (:dni, :nombre, :apellidos, :fecha, :email,:categoria,:oid_d,:oid_dep)");

		$stmt -> bindParam(":dni", $usuario['dni']);
		$stmt -> bindParam(":nombre", $usuario['nombre']);
		$stmt -> bindParam(":apellidos", $usuario['apellidos']);
		$stmt -> bindParam(":fecha", $fecha);
		$stmt -> bindParam(":email", $usuario['email']);
		$stmt -> bindParam(":categoria", $usuario['categoria']);
		$stmt -> bindParam(":oid_d", $oiddep['OID_D']);
		$stmt -> bindParam(":oid_dep", $usuario['oid_dep']);
		$stmt -> execute();
		return true;
	} catch(PDOException $e) {
		echo $e -> getMessage();
		return false;
	}
}

/* Función para dar de alta un usuario. Profesor
 ========================================================================== */
function alta_usuarioProf($conexion, $usuario) {
	try {
		$stmt = $conexion -> prepare("INSERT INTO USUARIOS (DNI, PASS, TIPOUSUARIO, ESADMINISTRADOR) VALUES (:dni, :pass, :tipoUsuario, :esAdmin)");
		$alumno = "Profesor";
		$esAdmin = "0";
		$stmt -> bindParam(":dni", $usuario["dni"]);
		$stmt -> bindParam(":pass", $usuario["pass"]);
		$stmt -> bindParam(":tipoUsuario", $alumno);
		$stmt -> bindParam(":esAdmin", $esAdmin);
		$stmt -> execute();
		return true;
	} catch(PDOException $e) {
		echo $e -> getMessage();
		return false;
	}
}

/* Función para consultar los despachos
 ========================================================================== */
function getDespachos ($conexion) {
	try {
		$stmt = $conexion -> prepare('SELECT Nombre, Capacidad, OID_D FROM Despachos');
		$stmt -> execute();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
	return $stmt;
}
/* Función para consultar los profesores de un despacho
 ========================================================================== */
function getOcupacion ($conexion,$oid_d) {
	try {
		$stmt = $conexion -> prepare('SELECT COUNT(*) FROM PROFESORES WHERE OID_D =:oid_d');
		$stmt -> bindParam(":oid_d", $oid_d);
		$stmt -> execute();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
	return $stmt -> fetchColumn();
}
?>