<?php
session_start();
	require_once('../../views/headerPacientePhp.php');
	$usuario=$_SESSION['usr']; //obtiene la variable de sesion usr
	
	if(!isset($usuario)){ //condicional que evalua si la variable usuario no existe para mandar una alerta de JAVASCRIPT y redirigir a la pagina index, si la variable usuario no es false dejara navegar con normalidad
		echo "<script>alert('Debe Iniciar Sesión');window.location.href='../../Index.php';</script>";
	}
?>
					<!-- CONTENT -->
		<?php
			require("../../mysql/Conexion.php"); //llama al archivo de conexion
			global $enlace; //invoca la variable global enlace


			$email = $_SESSION['usr']; //declara la variable docsu como resultado obtenido de un formulario POST
			$resultado = mysqli_query($enlace, "select * from usuario where Correo = '$email'"); //declara la variable resultado como un query de mysql en la variable global enlace

					while ($row = $resultado->fetch_assoc()) { // ciclo que extrae los datos de resultado convirtiendolo en un array llamado row

						$idUsuario = $row['idUsuario'];
						$resultado = mysqli_query($enlace, "select * from paciente where idUsuarioFK = '$idUsuario'");

						while ($row = $resultado->fetch_assoc()) { // ciclo que extrae los datos de resultado convirtiendolo en un array llamado row
							$Nombre = $row['Nombre'];
							$Apellido = $row['Apellido'];
							$Direccion = $row['Direccion'];
							$Telefono = $row['Telefono'];
							$FechaNacimiento = $row['FechaNacimiento'];
							$Estado = $row['Estado'];
							echo 
							"<div class='Interior'>
							<h1 class='enunciado'>Tus Datos:</h1>
							<table class='datos'>
								<tr>
									<td><h1 class='letras'>Nombre:</h1></td>
									<td><h1>$Nombre</h1></td>
								</tr>
								<tr>
									<td><h1>Apellido:</h1></td>
									<td><h1>$Apellido</h1></td>
								</tr>
								<tr>
									<td><h1>Dirección:</h1></td>
									<td><h1>$Direccion</h1></td>
								</tr>
								<tr>
									<td><h1>Telefono:</h1></td>
									<td><h1>$Telefono</h1></td>
								</tr>
								<tr>
									<td><h1>Fecha de Nacimiento:</h1></td>
									<td><h1>$FechaNacimiento</h1></td>
								</tr>
								<tr>
									<td><h1>Estado:</h1></td>
									<td><h1>$Estado</h1></td>
								</tr>
							</table>
							</div>";
						}
					}
					
		?>
<?php
require_once('../../views/footerPhp.php');
?>