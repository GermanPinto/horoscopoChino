<%@page import="com.desafiolaram.utilidades.ErrorConsultaHoroscopo"%>
<%@page import="com.desafiolaram.modelo.Horoscopo"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int error= (request.getAttribute("error")==null)?ErrorConsultaHoroscopo.SIN_ERROR:(int)request.getAttribute("error");
 %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Horóscopo</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Merienda+One">
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
<link rel="stylesheet" href="css/estilo.css">
<script>
	$(document)
			.ready(
					function() {
						
						let error=<%=error%>;
						if (error ==<%=ErrorConsultaHoroscopo.USUARIO_NO_ENCONTRADO %>) {
							document.getElementById('alertaLoginNoEncontrado').style.display = 'block';
						} else if (error ==<%=ErrorConsultaHoroscopo.SIN_ERROR%>){
							document.getElementById('alertaLoginNoEncontrado').style.display = 'none';
						}
					});
</script>					

</head>
<body>
	<%
		String nombreUsuarioLogeado = (String) session.getAttribute("nombreUsuarioLogeado");
	boolean isUsuarioLogeado = (nombreUsuarioLogeado == null || nombreUsuarioLogeado.isEmpty()) ? false : true;
	%>
	<!-- primero mostramos el navbar -->
	<jsp:include page="navGeneral.jsp" />  
	
		<div id="alertaLoginNoEncontrado" class="alert alert-danger container"
		role="alert">Su usuario no fue encontrado, vuelva a iniciar sesión con nombre de usuario y contraseña correctos.</div>

	<%
		Horoscopo horoscopoSeleccionado = new Horoscopo();
	horoscopoSeleccionado = (Horoscopo) request.getAttribute("horoscopoSeleccionado");
	if (horoscopoSeleccionado != null && horoscopoSeleccionado.getCodAnimal() != null) {
	%>

	<div class="container panel1 pt-3 mt-5">
		<div class="row">
			<p class="textoBienvenida">
				Bienvenido(a)
				<%=(nombreUsuarioLogeado == null) ? "" : nombreUsuarioLogeado%>, de
				acuerdo a tu fecha de nacimiento, tu animal en el horóscopo chino
				es:
			</p>
		</div>
	</div>

	<div class="container panel1 pt-3 mt-5">
		<div class="row">
			<div class="col-12 col-lg-4 divImagenA" id="fotoAnimal">
				<img class="img-fluid"
					src="img/<%=horoscopoSeleccionado.getCodAnimal()%>.png"
					alt="animal">
			</div>
			<div class="col-12 col-lg-8">
				<p class="tituloAnimal"><%=horoscopoSeleccionado.getNomAnimal()%></p>
				<p class="textoDescAnimal"><%=horoscopoSeleccionado.getDescAnimal()%></p>
			</div>
		</div>
	</div>
	<%
		} else {
	%>
	<div class="container panel1 pt-3 mt-5">
		<div class="row">
		<img src="img/banner.png" class="img-fluid img-thumbnail my-4" alt="banner">
		</div>
		<div class="row">
			<div class="col-12 col-lg-12 divImagenA my-4" id="fotoAnimal">
				<p class="textoBienvenida">Bienvenido(a), ingresa tu fecha de
					nacimiento para ver tu animal en el horóscopo chino, también puedes
					registrarte y/o logearte para guardar tu fecha:</p>
			</div>
			<div class="col-12 col-lg-12 my-4">
				<form action="ProcesaConsultaInvitado" method="post">
					<label class="col-form-label-lg" for="fechaAdd">Fecha Nacimiento</label> <input id="fechaAdd"
						name="ingresafechaInvitado" type="date" class="form-control mb-3"
						placeholder="dd-mm-aaaa" required> <input type="submit"
						value="enviar" class="btn btn-dark btn-lg btn-block">
				</form>
			</div>
		</div>
	</div>
	<%
		}
	%>
<div class="container">
	<div id="formularioLogeo" class="login-form modal fade ">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Login</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
         	 		<span aria-hidden="true">&times;</span>
        			</button>
        		</div>
        		<div class="modal-body">
				<form action="ProcesaInicioSesion" method="post">
					<div class="form-group has-error">
						<input type="text" class="form-control" name="username"
							placeholder="Nombre de Usuario" required="required">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="password"
							placeholder="Contraseña" required="required">
					</div>	
					<div class="form-group">
						<button type="submit" class="btn btn-dark btn-lg btn-block">Sign
							in</button>
					</div>
				</form>
				</div>
				<div class="modal-footer">
					<p><a href="#">Olvidaste tu contraseña?</a></p>
				</div>
			</div>
		</div>
		<p class="text-center medium">Nota: Si su perfil no es
			administrador, solo podrá consultar.</p>
		<!--  <p class="text-center small">
			No tienes cuenta? <a href="#">Regístrate Aquí!</a>
		</p>-->
	</div>
</div>
	<script type="text/javascript" src="js/main.js"></script>
</body>
</html>