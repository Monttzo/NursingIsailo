<?php
global $enlace; //declara la variable global enlace
$enlace = mysqli_connect("localhost", "root","", "proyecto"); //establece una conexion con mysql por medio de la variable enlace (puerto, usuario, contraseña, base de datos)
	if (!$enlace) { // realiza una condicion donde se niega la variable enlace que representa la conexion con mysql
		die( "Fallo la conexión a MySQL: (" . $mysqli -> mysqli_connect_errno(). ") " . $mysqli -> mysqli_connect_error()); // declara un die para mostrar el error de conexion con la base de datos
	}
?>
