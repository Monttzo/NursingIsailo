<form method="POST" action="../../mysql/Enfermero/RegistrarEnfermero.php">
	<table class="CrudForm">
		<tr>
			<td><input type="text" name="Nombre" class="CrudMed" placeholder="Nombre" autocomplete="off" required></td>
			<td><input type="text" name="Apellido" class="CrudMed" placeholder="Apellido" autocomplete="off" required></td>
		</tr>
		<tr>
			<td colspan="2"><input type="email" name="Correo" class="CrudMed" placeholder="Correo" autocomplete="off" required></td>
		</tr>
		<tr>
			<td><input type="Number" name="Telefono" class="CrudMed" placeholder="Telefono" autocomplete="off"  required></td>
			<td><input type="Number" name="TarjetaProfesional" class="CrudMed" placeholder="Tarjeta Profesional" autocomplete="off" required></td>
		</tr>
		<tr>
			<td colspan="2"><input type="Password" name="Password" class="CrudMed" placeholder="Password" autocomplete="off" required></td>
		</tr>
		<tr>
			<td colspan="2"><input type="text" name="Direccion" class="CrudMed" placeholder="Direccion" autocomplete="off" required></td>
		</tr>
		<tr>
			<td>
				<select name="Estado" class="CrudMedSe" autocomplete="off" required>
					<option>Activo</option>
					<option>Inactivo</option>
				</select>
			</td>
			<td>
				<select name="Rol" class="CrudMedSe" autocomplete="off" required>
					<option>Médico</option>
					<option>Enfermero</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="Submit" name="Registrar" class="CrudMed" value="Registrar"></td>
		</tr>
	</table>
</form>