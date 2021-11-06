<?php
require_once('views/headerLogin.php');
?>
					<!-- CONTENT -->
					<h1><center>Iniciar Sesión</center></h1>
					<form method="POST" action="mysql/login.php">
						<table class="login">
							<tr>
								<td><input type="email" name="email" placeholder="Correo" autocomplete="off"></td> 
							</tr>
							<tr>
								<td><input type="password" name="password" placeholder="Contraseña" autocomplete="off"></td>
							</tr>
							<tr>
								<td><input type="submit" name="Login" value="Ingresar"></td>
							</tr>
						</table>
					</form>
<?php
require_once('views/footer.php');
?>