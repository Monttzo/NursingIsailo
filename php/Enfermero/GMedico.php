<?php
session_start();
	$Rol = $_SESSION['Rol'];
		require_once ("../../views/headerEnfermeroPhp.php");
	$usuario=$_SESSION['usr']; //obtiene la variable de sesion usr
	
	if(!isset($usuario)){ //condicional que evalua si la variable usuario no existe para mandar una alerta de JAVASCRIPT y redirigir a la pagina index, si la variable usuario no es false dejara navegar con normalidad
		echo "<script>alert('Debe Iniciar Sesión');window.location.href='../Index.php';</script>";
	}
?>
					<!-- CONTENT -->
					<div class="Interno">
						<ul>
							<ul><h1 class="btnCrudRe">Registrar</h1>
								<div class="Crudre">
									<?php require_once('CrudRe.php'); ?>
								</div>
							</ul>
							<ul><h1 class="btnCrudCon">Consultar</h1>
								<div class="CrudCon">
									<?php require_once('CrudCon.php');?>
								</div>
							</ul>
							<ul><h1 class="btnCrudMo">Modificar</h1>
								<div class="CrudMo">
									<?php require_once('CrudMo.php'); ?>
								</div>
							</ul>
							<ul><h1 class="btnCrudAc">Activar o Inactivar</h1>
								<div class="CrudAc">
									<?php require_once('CrudAc.php'); ?>
								</div>
							</ul>	
						</ul>
					</div>
<?php
require_once('../../views/footerPhp.php');
?>