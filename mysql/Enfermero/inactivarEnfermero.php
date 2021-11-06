<?php
	error_reporting(E_ERROR | E_WARNING | E_PARSE);
	session_start();
	$Rol = $_SESSION['Rol'];
		require_once ("../../views/headerEnfermeroPhp.php");
	$usuario=$_SESSION['usr']; //obtiene la variable de sesion usr
	
	if(!isset($usuario)){ //condicional que evalua si la variable usuario no existe para mandar una alerta de JAVASCRIPT y redirigir a la pagina index, si la variable usuario no es false dejara navegar con normalidad
		echo "<script>alert('Debe Iniciar Sesión');window.location.href='../../../Index.php';</script>";
	}
?>
<?php
	require('../../mysql/Conexion.php');
	global $enlace;
		$idMedico = $_POST['idMedico'];

		$idMedicofilas = mysqli_query($enlace, "select * from medico where idMedico = $idMedico;");
		$idMedicoRows = $idMedicofilas -> num_rows;
		if ($idMedicofilas -> num_rows > 0) {
		
			$resultado = mysqli_query($enlace, "select * from usuario where idUsuario = $idMedico;");
			$row = mysqli_fetch_array($resultado);
			$nombreUsuario = $row['Nombre'];
			$idUsuario = $row['idUsuario'];
			$Direccion = $row['Direccion']; 

			$resultadoUsuario = mysqli_query($enlace, "select * from medico where Nombre = '$nombreUsuario';");			
			$rowU = mysqli_fetch_array($resultadoUsuario);
				
				$apellidoUsuario = $rowU['Apellido'];
				$correo = $rowU['Correo'];
				$Telefono = $rowU['Telefono'];
				$Especialidad = $rowU['Especialidad'];
				$Tprofesional = $rowU['TarjetaProfesional'];
				$Estado = $rowU['Estado'];

				switch ($Estado) {
					case 1:
						$Estadochar = 'Activo';
						$value = 'Inactivar';
						break;
					case 0:
						$Estadochar = 'Inactivo';
						$value = 'Activar';
						break;
				}
							
				echo "<div class='Interior'>
				<form method='POST' action='inactivarEnfermeroSql.php'>
				<table class='datos'>
				<tr>
					<td colspan='2'><h1>Datos del Medico.</h1></td>
				</tr>
				<tr>
					<td><h1>Estado:</h1></td>
					<td><h1>$Estadochar <input type='hidden' value='$Estado' name='Estado'></h1></td>
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
					<td><h1>Direccion:</h1></td>
					<td><h1>$Direccion</h1></td>
				</tr>
				<tr>
					<input type='hidden' name='idMedico' value='$idMedico'>
					<input type='hidden' name='idUsuario' value='$idUsuario'>
				</tr>
				<tr>
					<td colspan='2'><input type='submit' value = '$value' class='CrudMed'></td>
				</tr>
				</table>
				</form>
				</div>";
			
		} else {
			echo "<script>alert('El usuario no existe');window.location.href='../../php/Enfermero/GMedico.php';</script>";
		}
		?>
	</div>
		<?php
	require_once ("../../views/footerPhp.php");
?>