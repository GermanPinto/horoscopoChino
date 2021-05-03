<!DOCTYPE html>
<%@page import="com.desafiolaram.utilidades.ErrorAdministraUsuario"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="com.desafiolaram.modelo.Usuario"%>
<%
int error= (request.getAttribute("error")==null)?ErrorAdministraUsuario.SIN_ERROR:(int)request.getAttribute("error");
%>
<html lang="es">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bootstrap CRUD Data Table for Database with Modal Form</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<script>
	$(document)
			.ready(
					function() {
						
						let error=<%=error%>;
						if (error ==<%=ErrorAdministraUsuario.ERROR_USUARIO_NO_ENCONTRADO%>) {
							document.getElementById('alertaNoEncontrado').style.display = 'block';
						} else if (error ==<%=ErrorAdministraUsuario.SIN_ERROR%>){
							document.getElementById('alertaNoEncontrado').style.display = 'none';
						}
						
						
						// Activate tooltip
						$('[data-toggle="tooltip"]').tooltip();

						// Select/Deselect checkboxes
						var checkbox = $('table tbody input[type="checkbox"]');
						$("#selectAll").click(function() {
							if (this.checked) {
								checkbox.each(function() {
									this.checked = true;
								});
							} else {
								checkbox.each(function() {
									this.checked = false;
								});
							}
						});
						checkbox.click(function() {
							if (!this.checked) {
								$("#selectAll").prop("checked", false);
							}
						});
					});
</script>
<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
	<%	
	String nombreUsuarioLogeado = (String) session.getAttribute("nombreUsuarioLogeado");
	boolean isUsuarioLogeado = (nombreUsuarioLogeado == null || nombreUsuarioLogeado.isEmpty()) ? false : true;
	%>
	<!-- primero mostramos el navbar -->
	
	<jsp:include page="navGeneral.jsp" />  
	
	<div class="container containerTablaUsuarios panel1 mt-3">

		<form class="form-inline" action="BuscaUsuario" method="get">
			<div class="row">
				<div class="form-group mb-1">
					<label for="nombreUsuarioBusqueda" id="labelBusqueda">Busqueda
						Usuario: </label>
				</div>
				<div class="form-group mx-sm-2 mb-1">
					<input type="text" class="form-control" id="nombreUsuarioBusqueda"
						name="nombreUsuarioBusqueda" placeholder=" usuario">
				</div>
				<button type="submit" class="btn btn-primary mb-2">Buscar</button>
			</div>
			<div>
				<div class="form-group mb-1">
					<p class="text-primary text-center font-weight-light"><small>Puede buscar por nombre de usuario, nombre o apellido</small></p>
				</div>
			</div>
		</form>

	</div>
	<div id="alertaNoEncontrado" class="alert alert-danger container"
		role="alert">El usuario indicado no fue encontrado. Intentelo
		nuevamente.</div>
	<div class="container-xl containerTablaUsuarios">
		<div class="table-responsive">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>
							Administrador de <b>Usuarios</b>
						</h2>
					</div>
					<div class="col-sm-6">
						<a href="#addEmployeeModal" class="btn btn-success"
							data-toggle="modal" data-target="#addEmployeeModal"><i class="material-icons">&#xE147;</i>
							<span>Agregar Nuevo Usuario</span></a>
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Id</th>
						<th>Nombre</th>
						<th>Apellido</th>
						<th>Email</th>
						<th>Fecha Nacimiento</th>
						<th>Nombre Usuario</th>
						<th>Contraseña</th>
						<th>Es Administrador</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<%
						List<Usuario> usuarios = (List<Usuario>) request.getAttribute("listaUsuarios");
					Usuario usuarioSeleccionado = new Usuario();
					if (usuarios != null && usuarios.size() > 0 && !usuarios.isEmpty()) {
						for (Usuario usuario : usuarios) {
							usuarioSeleccionado = usuario;
					%>
					<tr>
						<td><%=usuario.getId()%></td>
						<td><%=usuario.getNombre()%></td>
						<td><%=usuario.getApellido()%></td>
						<td><%=usuario.getEmail()%></td>
						<td><%=usuario.getFechaNacimiento().toString()%></td>
						<td><%=usuario.getNombreUsuario()%></td>
						<td><%=usuario.getContraseña()%></td>
						<td><%=usuario.isEsAdmin()%></td>
						<td>
						<a href="ProcesaUpdate?idUsuarioseleccionado=<%=usuario.getId()%>"
							id="botonEdit" class="edit"><i class="material-icons"
								data-toggle="tooltip" title="Editar">&#xE254;</i></a>
						<a href="ProcesaElimina?idUsuarioseleccionado=<%=usuario.getId()%>"
							class="delete"><i class="material-icons"
								data-toggle="tooltip" title="Borrar">&#xE872;</i></a>
						</td>
					</tr>
					<%
						}
					}
					%>
				</tbody>
			</table>

		</div>
	</div>
	<!-- Edit Modal HTML -->
	<div id="addEmployeeModal" class="modal fade containerTablaUsuarios">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="AgregarUsuario" method="POST"
					onsubmit="return validarAdd();">
					<div class="modal-header">
						<h4 class="modal-title">Agregar Usuario</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Nombre</label> <input name="nombreAdd" id="nombreAdd"
								type="text" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Apellido</label> <input name="apellidoAdd"
								id="apellidoAdd" type="text" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Email</label> <input name="emailAdd" id="emailAdd"
								type="email" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Fecha Nacimiento</label> <input name="fechaAdd"
								id="fechaAdd" type="date" class="form-control"
								placeholder="dd-mm-aaaa" required>

						</div>
						<div class="form-group">
							<label>Nombre Usuario</label> <input name="nombreUsuarioAdd"
								id="nombreUsuarioAdd" type="text" class="form-control" required>

						</div>
						<div class="form-group">
							<label>Contraseña</label> <input name="contrasenaAdd"
								id="contrasenaAdd" type="text" class="form-control" required>
						</div>

					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancelar"> <input type="submit"
							class="btn btn-success" value="Add">
					</div>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="js/main.js"></script>
</body>
</html>