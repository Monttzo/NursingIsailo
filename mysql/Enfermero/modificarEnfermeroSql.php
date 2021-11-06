<?php
require('../../mysql/Conexion.php');
global $enlace;

$Nombre = $_POST['Nombre'];
$Apellido = $_POST['Apellido'];
$Correo = $_POST['Correo'];
$Telefono = $_POST['Telefono'];
$Tprofesional = $_POST['TarjetaProfesional'];
$Direccion = $_POST['Direccion'];
$Password = $_POST['Password'];
$idMedico = $_POST['idMedico'];
$idUsuario = $_POST['idUsuario'];

$sql = "call modificarMedico ($idMedico , '$Nombre', '$Apellido', $Telefono, '$Correo', '$Direccion' , '$Password', $Tprofesional, $idUsuario);";
if ((is_numeric($Nombre))||(is_numeric($Apellido))||($Telefono < 0)||($Tprofesional < 0)){

	echo "<script>alert('Datos Incorrectos');window.location.href='modificarEnfermero.php';</script>";

} else {
	if (mysqli_query($enlace, $sql)) {

		echo "<script>alert('Usuario Modificado Correctamente');window.location.href='../../php/Enfermero/GMedico.php';</script>";

	} else {

		echo "<script>alert('No se pudo modificar el Usuario');window.location.href='../../php/Enfermero/GMedico.php';</script>";

	}
}
?>