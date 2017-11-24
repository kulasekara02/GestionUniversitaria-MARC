<?php
//Inicio de sesiones
session_start();

//Si existe una sesión de login, se elimina
if (isset($_SESSION['DNI'])) {
	unset($_SESSION['DNI']);
}

//Se redirige a la página de login
header("Location: login.php");
?>
