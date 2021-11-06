<?php
require('../../mysql/Conexion.php');
global $enlace;

$idMedico = $_POST['idMedico'];
$idUsuario = $_POST['idUsuario'];
$Estado = $_POST['Estado'];

if ($Estado = 1) {
	$sql = "call inactivarMedico ($idMedico , $idUsuario);";
		if (mysqli_query($enlace, $sql)) {

			echo "<script>alert('Usuario Inactivado Correctamente');window.location.href='../../php/Enfermero/GMedico.php';</script>";

		} else {

			echo "<script>alert('No se pudo inactivar el Usuario');window.location.href='../../php/Enfermero/GMedico.php';</script>";

		}
} else {
	if ($Estado = 0) {
		$sql = "call ActivarMedico ($idMedico , $idUsuario);";
		if (mysqli_query($enlace, $sql)) {

			echo "<script>alert('Usuario Activado Correctamente');window.location.href='../../php/Enfermero/GMedico.php';</script>";

		} else {

			echo "<script>alert('No se pudo Activar el Usuario');window.location.href='../../php/Enfermero/GMedico.php';</script>";

		}
	}
}
?>