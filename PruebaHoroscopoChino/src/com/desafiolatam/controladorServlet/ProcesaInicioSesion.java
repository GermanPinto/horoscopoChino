package com.desafiolatam.controladorServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.desafiolaram.modelo.Usuario;
import com.desafiolaram.utilidades.ErrorConsultaHoroscopo;
import com.desafiolatam.modeloDAO.IUsuarioDao;
import com.desafiolatam.modeloDAO.UsuarioDaoImp;



@WebServlet("/ProcesaInicioSesion")
public class ProcesaInicioSesion extends HttpServlet {

	private static final long serialVersionUID = 1L;
	

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// utiliza el dao para buscar el usuario en la bd
		Usuario usuario = new Usuario();
		IUsuarioDao usuarioDao = new UsuarioDaoImp();
		usuario = usuarioDao.findUsuario(request.getParameter("username"), request.getParameter("password"));
		HttpSession session = request.getSession();

		// si encuentra el usuario y este es admin, entonces nos lleva a la vista de
		// administracion
		if (usuario != null && usuario.isEsAdmin() == true) {
			session.setAttribute("nombreUsuarioLogeado", usuario.getNombreUsuario());
			request.setAttribute("nacimientoUsuarioLogeado", usuario.getFechaNacimiento());
			request.setAttribute("error", ErrorConsultaHoroscopo.SIN_ERROR);
			request.getRequestDispatcher("AdministraUsuario").forward(request, response);

			// si no es admin, pero si tiene un usuario en la base de datos, entonces lo
			// enviamos a ver la pagina que muestra su horoscopo
		} else if (usuario != null) {
			session.setAttribute("nombreUsuarioLogeado", usuario.getNombreUsuario());
			request.setAttribute("fechaUsuario", usuario.getFechaNacimiento());
			request.setAttribute("error", ErrorConsultaHoroscopo.SIN_ERROR);
			request.getRequestDispatcher("ProcesaConsultaSigno").forward(request, response);

		} else {
			// si no encuentra al usuario, entonces vuelve al login
			request.setAttribute("error", ErrorConsultaHoroscopo.USUARIO_NO_ENCONTRADO);
			request.getRequestDispatcher("indexConsultaHoroscopo.jsp").forward(request, response);
		}
	}

}
