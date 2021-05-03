<%@page import="com.desafiolatam.modeloDAO.UsuarioDaoImp"%>
<%@page import="com.desafiolaram.modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>editar Usuario</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
<% 
	UsuarioDaoImp usuarioImp= new UsuarioDaoImp();	
	String idUsuarioseleccionado= (String)request.getAttribute("idUsuarioseleccionado");

	Usuario usuarioSeleccionado= usuarioImp.getById(Integer.parseInt(idUsuarioseleccionado));

%>
<div class="container-xl containerTablaUsuarios">
<!-- Edit Modal HTML -->
<div id="editEmployeeModal" class="table-responsive">
	<div class="table-wrapper">
		<div >
			<form action="ProcesaUpdate" method="post" onsubmit="return validar();">
				<div class="table-title">		
					<div class="col-sm-8">				
					<h4 class="modal-title">Editar Usuario</h4>
					</div>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div >	
					<div class="form-group">
						<input name="idEdit" id="idEdit" type="hidden" class="form-control" required value="<%=usuarioSeleccionado.getId() %>">
					</div>				
					<div class="form-group">
						<label>Nombre</label>
						<input name="nombreEdit" id="nombreEdit" type="text" class="form-control" required value="<%=usuarioSeleccionado.getNombre() %>">
					</div>
					<div class="form-group">
						<label>Apellido</label>
						<input name="apellidoEdit" id="apellidoEdit" type="text" class="form-control" required  value="<%=usuarioSeleccionado.getApellido() %>">
					</div>
					<div class="form-group">
						<label>Email</label>
						<input name="emailEdit" id="emailEdit" type="email" class="form-control" required  value="<%=usuarioSeleccionado.getEmail() %>">
					</div>
					<div class="form-group">
						<label>Fecha Nacimiento</label>
					<input name="fechaEdit" id="fechaEdit" type="date" class="form-control" required placeholder="dd-mm-aaaa" value="<%=usuarioSeleccionado.getFechaNacimiento().toString()%>"> 

					</div>
					<div class="form-group">
						<label>Nombre Usuario</label>
						<input name="nombreUsuarioEdit" id="nombreUsuarioEdit" type="text" class="form-control" required  value="<%=usuarioSeleccionado.getNombreUsuario() %>">
					</div>	
					<div class="form-group">
						<label>Contraseña</label>
						<input name="contrasenaEdit" id="contrasenaEdit" type="text" class="form-control" required  value="<%=usuarioSeleccionado.getContraseña() %>">
					</div>		
					<div class="form-group">
						<label>Es Admin</label>
						<input name="esAdminEdit" id="esAdminEdit" type="text" class="form-control" required  value="<%=usuarioSeleccionado.isEsAdmin() %>">
					</div>			
	
				</div>
				<div >
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
					<input type="submit" class="btn btn-info" value="Guardar">
				</div>
			</form>
		</div>
	</div>
</div>
</div>
<script type="text/javascript" src="js/main.js"></script> 
</body>
</html>