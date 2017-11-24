<?php
   /* Función para obtener eventos
 ========================================================================== */
function getEventos($conexion, $dni) {
	try {
		$stmt = $conexion -> prepare("SELECT Fecha,Nombre, OID_E FROM Eventos WHERE DNI=:dni ORDER BY Fecha");
		$stmt -> bindParam(":dni", $dni);
		$stmt -> execute();
		return $stmt;
	} catch(PDOException $e) {
		echo $e -> getMessage();
		return false;
	}
}
/* Función para eliminar un evento.
 ========================================================================== */
function eliminarEvento($conexion, $oid_e) {
	try {
		$stmt = $conexion -> prepare("DELETE FROM EVENTOS WHERE OID_E= :OID_E");
		$stmt -> bindParam(":OID_E", $oid_e);
		$stmt -> execute();
		return true;
	} catch(PDOException $e) {
		echo $e -> getMessage();
		return false;
	}
}

/* Función para añadir un evento.
 ========================================================================== */
function anadirEvento($conexion, $datos) {
	try {
		$stmt = $conexion -> prepare("INSERT INTO Eventos (DNI, FECHA, NOMBRE) VALUES (:dni, :fecha, :nombre)");
		$stmt -> bindParam(":dni", $datos['DNI']);
		$stmt -> bindParam(":fecha", $datos['FECHA']);
		$stmt -> bindParam(":nombre", $datos['NOMBRE']);
		$stmt -> execute();
		return true;
	} catch(PDOException $e) {
		echo $e -> getMessage();
		return false;
	}
}
?>