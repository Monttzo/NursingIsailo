<?php
session_start();
	$Rol = $_SESSION['Rol'];
	switch ($Rol) {
		case 'Paciente': require ("../views/headerPaciente.php");
		break;
		case 'Enfermero': require ("../views/headerEnfermero.php");
		break;
		case 'Medico': require ("../views/headerMedico.php");
		break; // envia una alerta con JAVASCRIPT
	}
	$usuario=$_SESSION['usr']; //obtiene la variable de sesion usr
	
	if(!isset($usuario)){ //condicional que evalua si la variable usuario no existe para mandar una alerta de JAVASCRIPT y redirigir a la pagina index, si la variable usuario no es false dejara navegar con normalidad
		echo "<script>alert('Debe Iniciar Sesión');window.location.href='../Index.php';</script>";
	}
?>
					<!-- CONTENT -->
		<?php
			require("../mysql/Conexion.php"); //llama al archivo de conexion
			global $enlace; //invoca la variable global enlace


			$email = $_SESSION['usr']; //declara la variable docsu como resultado obtenido de un formulario POST
			$resultado = mysqli_query($enlace, "select * from usuario where Correo = '$email'"); //declara la variable resultado como un query de mysql en la variable global enlace

					while ($row = $resultado->fetch_assoc()) { // ciclo que extrae los datos de resultado convirtiendolo en un array llamado row

						$nombreUsuario = $row['Nombre'];
						$apellidoUsuario = $row['Apellido'];


						
						echo "<h1><center><div class='Inicio'> &nbsp;&nbsp;&nbsp;&nbsp;Bienvenido $nombreUsuario $apellidoUsuario</div></center></h1>";
					}
					
		?>
<?php
require_once('../views/footer.php');
?>