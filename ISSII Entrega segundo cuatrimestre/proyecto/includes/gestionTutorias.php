<?php
    /* Función para obtener todas las tutorías de un profesor.
 ========================================================================== */
function tutoriasProfesor($conexion, $DNI) {
	try {
		$stmt = $conexion -> prepare('CALL PR_Tutorias_Profesor(:DNI)');
		$stmt -> bindParam(':DNI', $DNI);
		$stmt -> execute();
		return $stmt;
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para obtener la información de HorarioProfesores.
 ========================================================================== */
function DiasTutoriaProfesor($conexion, $DNI) {
	try {
		$stmt = $conexion -> prepare('SELECT Hora_Comienzo_Tutoria, Hora_Fin_Tutoria, Dia FROM HorarioProfesores WHERE DNI = :DNI');
		$stmt -> bindParam(':DNI', $DNI);
		$stmt -> execute();
		return $stmt;
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para cambiar el estado de una tutoría a aceptada.
 ========================================================================== */
function aceptaTutoria($conexion, $OID_T) {
	try {
		$stmt = $conexion -> prepare("UPDATE TUTORIAS SET ESTADO = 'Aceptada' WHERE OID_T = :OID_T");
		$stmt -> bindParam(':OID_T', $OID_T);
		$stmt -> execute();
		return true;
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para cambiar el estado de una tutoría a Rechazada.
 ========================================================================== */
function rechazaTutoria($conexion, $OID_T) {
	try {
		$stmt = $conexion -> prepare("UPDATE TUTORIAS SET ESTADO = 'Rechazada' WHERE OID_T = :OID_T");
		$stmt -> bindParam(':OID_T', $OID_T);
		$stmt -> execute();
		return true;
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para pedir una tutoría
 ========================================================================== */
function pedirTutoria($conexion, $dniAlum, $dniProf, $fecha, $hora) {
	try {
		$fecha = getFechaFormateada($fecha);
		$stmt = $conexion -> prepare("INSERT INTO Tutorias (Fecha,Hora_comienzo,Duracion,Estado,DNI_Alum,DNI_Prof) VALUES (:fecha, :hora, '15', 'Pendiente', :dniAlum, :dniProf)");
		$stmt -> bindParam(":dniAlum", $dniAlum);
		$stmt -> bindParam(":dniProf", $dniProf);
		$stmt -> bindParam(":hora", $hora);
		$stmt -> bindParam(":fecha", $fecha);
		$stmt -> execute();
		return true;
	} catch(PDOException $e) {
		$_SESSION['excepcion'] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para obtener cuantas tutorías tiene un profesor
 ========================================================================== */
function getNumeroTutoriasProfesor($conexion, $DNI) {
	try {
		$consulta = "SELECT COUNT(*) FROM HorarioProfesores WHERE DNI = :DNI";
		$pdoStmt = $conexion -> prepare($consulta);
		$pdoStmt -> bindParam(':DNI', $DNI);
		$pdoStmt -> execute();
		return $pdoStmt -> fetchColumn();
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para obtener las horas disponibles de tutorías (15 minutos cada una)
 ========================================================================== */
function getHorasTutoriaDisponibles($conexion, $dniProf, $dia) {
	try {
		$stmt = $conexion -> prepare('SELECT Hora_Comienzo_Tutoria, Hora_Fin_Tutoria FROM HorarioProfesores WHERE DNI = :DNI AND DIA = :DIA ORDER BY Hora_Comienzo_Tutoria');
		$stmt -> bindParam(':DNI', $dniProf);
		$stmt -> bindParam(':DIA', $dia);
		$stmt -> execute();
		$horasTutoria = $stmt;
		$horas = array();
		foreach($horasTutoria as $hora){
			$horaComienzo = $hora["HORA_COMIENZO_TUTORIA"];
			$horaFin = $hora["HORA_FIN_TUTORIA"];
			$horaComienzoFormat = strtotime($horaComienzo);
			$horaFinFormat = strtotime($horaFin);
			while ($horaComienzoFormat != $horaFinFormat) {
				array_push($horas, $horaComienzoFormat);
				$horaComienzoFormat = strtotime('+15 minute', $horaComienzoFormat);
			}
		}
		return $horas;
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para traducir días inglés->español
 ========================================================================== */
function traducirDiaInglesEsp($day) {
	$dia = "";
	switch($day) {
		CASE 'Monday' :
			$dia = 'Lunes';
			break;
		CASE 'Tuesday' :
			$dia = 'Martes';
			break;
		CASE 'Wednesday' :
			$dia = 'Miércoles';
			break;
		CASE 'Thursday' :
			$dia = 'Jueves';
			break;
		CASE 'Friday' :
			$dia = 'Viernes';
			break;
	}
	return $dia;
}

/* Función para traducir días español->inglés
 ========================================================================== */
function traducirDiaEspIngles($dia) {
	$day = "";
	switch($dia) {
		CASE 'Lunes' :
			$day = 'Monday';
			break;
		CASE 'Martes' :
			$day = 'Tuesday';
			break;
		CASE 'Miércoles' :
			$day = 'Wednesday';
			break;
		CASE 'Jueves' :
			$day = 'Thursday';
			break;
		CASE 'Viernes' :
			$day = 'Friday';
			break;
	}
	return $day;
}

/* Función para obtener la fecha de las tutorías (desde el día actual hasta 2 semanas)
 ========================================================================== */
function getFechasTutorias($diaEsp) {
	$diaIngles = traducirDiaEspIngles($diaEsp);
	$fechaActual = date("d-m-Y");
	$fechaActualFormat = strtotime($fechaActual);
	$dias = array();
	for ($i = 0; $i < 30; $i++) {
		$dia = strftime('%A', date($fechaActualFormat));
		$dia = traducirDiaInglesEsp(ucwords($dia));
		if ($dia == $diaEsp) {
			array_push($dias, date("d-m-Y", $fechaActualFormat));
		}
		$fechaActualFormat = strtotime('+1 days', $fechaActualFormat);
	}
	return $dias;
}

/* Función para obtener la información de HorarioProfesores.
 ========================================================================== */
function getInfoHorarioProfesores($conexion, $DNI) {
	try {
		$stmt = $conexion -> prepare('SELECT OID_H, Hora_Comienzo_Tutoria, Hora_Fin_Tutoria, Dia FROM HorarioProfesores WHERE DNI = :DNI');
		$stmt -> bindParam(':DNI', $DNI);
		$stmt -> execute();
		return $stmt;
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}

/* Función para obtener los días de HorarioProfesores.
 ========================================================================== */
function getDiasHorarioProfesores($conexion, $DNI) {
	try {
		$stmt = $conexion -> prepare('SELECT DISTINCT Dia FROM HorarioProfesores WHERE DNI = :DNI');
		$stmt -> bindParam(':DNI', $DNI);
		$stmt -> execute();
		return $stmt;
	} catch(PDOException $e) {
		$_SESSION["excepcion"] = $e -> GetMessage();
		header("Location: excepcion.php");
	}
}
?>