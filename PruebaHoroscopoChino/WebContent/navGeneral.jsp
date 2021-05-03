<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String nombreUsuarioLogeado = (String) session.getAttribute("nombreUsuarioLogeado");
	boolean isUsuarioLogeado = (nombreUsuarioLogeado == null || nombreUsuarioLogeado.isEmpty()) ? false : true;
	%>


	<nav class="navbar navbar-expand-xl navbar-light bg-light">
		<a href="#" class="navbar-brand"><i class="fa fa-cube"></i>Horoscopo<b>Chino</b></a>
		<button type="button" class="navbar-toggler" data-toggle="collapse"
			data-target="#navbarCollapse">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- Collection of nav links, forms, and other content for toggling -->
		<div id="navbarCollapse"
			class="collapse navbar-collapse justify-content-start">
			<div class="navbar-nav">
				<a href="indexConsultaHoroscopo.jsp" class="nav-item nav-link active">Inicio</a> 
			</div>
			<%
				if (isUsuarioLogeado) {
			%>
			<div class="navbar-nav ml-auto" id="usuarioLogueado">
				<div class="nav-item dropdown">
					<a href="#" data-toggle="dropdown"
						class="nav-link dropdown-toggle user-action"> <img
						src="img/avatar.png" class="avatar" alt="Avatar"> <%=nombreUsuarioLogeado==null?"":nombreUsuarioLogeado%>
						<b class="caret"></b>
					</a>
					<div class="dropdown-menu">
						<a href="#" class="dropdown-item"><i class="fa fa-user-o"></i>Perfil</a>
						<a href="CerrarSesion" class="dropdown-item"><i
							class="material-icons">&#xE8AC;</i> Logout</a>
					</div>
				</div>
			</div>
			<%
				} else {
			%>
			<div class="navbar-nav" id="registroIdentificacion">
				<a href="#formularioLogeo" class="btn btn-dark" data-toggle="modal" data-target="#formularioLogeo">Entrar</a>
				<!--  <a	href="login.jsp" class="nav-item nav-link">Registro</a>-->
			</div>
			<%
				}
			%>
		</div>
	</nav>
	

</body>
</html>