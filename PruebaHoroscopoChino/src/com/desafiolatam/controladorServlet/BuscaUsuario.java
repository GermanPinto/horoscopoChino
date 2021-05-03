package com.desafiolatam.controladorServlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.desafiolaram.modelo.Usuario;
import com.desafiolaram.utilidades.ErrorAdministraUsuario;
import com.desafiolatam.modeloDAO.UsuarioDaoImp;

/**
 * Servlet implementation class BuscaUsuario
 */
@WebServlet("/BuscaUsuario")
public class BuscaUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public BuscaUsuario() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String nombreUsuario = (String)request.getParameter("nombreUsuarioBusqueda");
		 boolean usuarioEncontrado=false;
		 	Usuario usuario = new Usuario();
			List<Usuario> usuarios=new ArrayList<Usuario>();
			UsuarioDaoImp usuarioImp= new UsuarioDaoImp();		
			usuario= usuarioImp.findUsuario(nombreUsuario); //pide todos los usuarios por medio del dao a la BD
			if(usuario!=null && usuario.getId()!=0 ){
			usuarioEncontrado=true;
			usuarios.add(usuario);
			request.setAttribute("listaUsuarios", usuarios);
			request.setAttribute("error", ErrorAdministraUsuario.SIN_ERROR);
			request.getRequestDispatcher("administraUsuarios.jsp").forward(request, response);	
			}else {
				request.setAttribute("error", ErrorAdministraUsuario.ERROR_USUARIO_NO_ENCONTRADO);
				request.getRequestDispatcher("/administraUsuarios.jsp").forward(request, response);	
			}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
