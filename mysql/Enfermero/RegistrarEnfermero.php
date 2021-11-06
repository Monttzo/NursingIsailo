<?php
require('../Conexion.php');
global $enlace;
$Nombre = $_POST['Nombre'];
$Apellido = $_POST['Apellido'];
$Telefono = $_POST['Telefono'];
$Direccion = $_POST['Direccion'];
$Correo = $_POST['Correo'];
$TarjetaProfesional = $_POST['TarjetaProfesional'];
$Password = $_POST['Password'];
$EstadoChar = $_POST['Estado'];
$Rol = $_POST['Rol'];

switch ($EstadoChar) {
	case 'Activo':
		 $EstadoNum = 1;
		break;
	case 'Inactivo':
		 $EstadoNum = 0;
		break;
	default:
		 echo "<script>alert('Datos Incorrectos');</script>";
		break;
	}
	$idMedicofilas = mysqli_query($enlace, "select * from medico;");
	$idMedicoRows = $idMedicofilas -> num_rows;
	$idMedico = $idMedicoRows + 1; 
	$idUsuariofilas = mysqli_query($enlace, "select * from usuario");
	$idUsuarioRows = $idUsuariofilas -> num_rows;
	$idUsuario = $idUsuarioRows + 1;  
	$sql = "call insertarMedico ($idMedico, $idUsuario, '$Nombre', '$Apellido', $Telefono, '$Correo', '$Rol', $TarjetaProfesional, $EstadoNum, '$Password', '$Direccion', '$Rol');";

	if(($Telefono<0)||(is_numeric($Nombre))||(is_numeric($Apellido))||($TarjetaProfesional < 0)){
		echo "<script>alert('Datos no validos'); window.location.href='../../php/Enfermero/GMedico.php';</script>";
	}else {
		if (mysqli_query($enlace, $sql)) {
			echo "<script>alert('Usuario Registrado Correctamente');window.location.href='../../php/Enfermero/GMedico.php';</script>";
		} else {
			echo "<script>alert('No se pudo registrar el Usuario');window.location.href='../../php/Enfermero/GMedico.php';</script>";
		}
	}
?>