<?php
	session_start();
	$Rol = $_SESSION['Rol'];
		require_once ("../../views/headerEnfermeroPhp.php");
	$usuario=$_SESSION['usr']; //obtiene la variable de sesion usr
	
	if(!isset($usuario)){ //condicional que evalua si la variable usuario no existe para mandar una alerta de JAVASCRIPT y redirigir a la pagina index, si la variable usuario no es false dejara navegar con normalidad
		echo "<script>alert('Debe Iniciar Sesión');window.location.href='../Index.php';</script>";
	}
	?>
	<?php
	require('../../mysql/Conexion.php');
	global $enlace;
		$idMedico = $_POST['idMedico'];

		$idMedicofilas = mysqli_query($enlace, "select * from medico where idMedico = $idMedico;");
		$idMedicoRows = $idMedicofilas -> num_rows;
		if ($idMedicofilas -> num_rows > 0) {
		
			$resultado = mysqli_query($enlace, "select * from medico where idMedico = $idMedico;");
			while ($row = $resultado->fetch_assoc()) { // ciclo que extrae los datos de resultado convirtiendolo en un array llamado row

				$nombreUsuario = $row['Nombre'];
				$apellidoUsuario = $row['Apellido'];
				$correo = $row['Correo'];
				$Telefono = $row['Telefono'];
				$Especialidad = $row['Especialidad'];
				$Tprofesional = $row['TarjetaProfesional'];
				$Estado = $row['Estado'];

				switch ($Estado) {
					case 1:
						$Estadochar = 'Activo';
						break;
					case 0:
						$Estadochar = 'Inactivo';
						break;
				}
							
				echo "<div class='Interior'>
				<table class='datos'>
				<tr>
					<td colspan='2'><h1>Datos del Medico.</h1></td>
				</tr>
				<tr>
					<td><h1>Estado:</h1></td>
					<td><h1>$Estadochar</h1></td>
				</tr>
				<tr>
					<td><h1>Nombre:</h1></td>
					<td><h1>$nombreUsuario</h1></td>
				</tr>
				<tr>
					<td><h1>Apellido:</h1></td>
					<td><h1>$apellidoUsuario</h1></td>
				</tr>
				<tr>
					<td><h1>Correo:</h1></td>
					<td><h1>$correo</h1></td>
				</tr>
				<tr>
					<td><h1>Telefono:</h1></td>
					<td><h1>$Telefono</h1></td>
				</tr>
				<tr>
					<td><h1>Especialidad:</h1></td>
					<td><h1>$Especialidad</h1></td>
				</tr>
				<tr>
					<td><h1>Tarjeta Profesional:</h1></td>
					<td><h1>$Tprofesional</h1></td>
				</tr>
				<tr>
					<td colspan='2' class='volver'><a href='../../php/Enfermero/GMedico.php'><h1>Volver</h1></a></td>
				</tr>
				</table>
				</div>";
			}
		} else {
			echo "<script>alert('El usuario no existe');window.location.href='../../php/Enfermero/GMedico.php';</script>";
		}
		?>
	</div>
		<?php
	require_once ("../../views/footerPhp.php");
?>