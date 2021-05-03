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
import com.desafiolatam.modeloDAO.UsuarioDaoImp;


@WebServlet("/AdministraUsuario")
public class AdministraUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdministraUsuario() {
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // cuando entra desde el borrar o actualizar usamos doget, porque capturamos antes el id usuario por la url
		List<Usuario> usuarios=new ArrayList<Usuario>();
		UsuarioDaoImp usuarioDaoImp= new UsuarioDaoImp();		
		usuarios= usuarioDaoImp.getAll(); //pide todos los usuarios por medio del dao a la BD
		request.setAttribute("listaUsuarios", usuarios);
		request.getRequestDispatcher("administraUsuarios.jsp").forward(request, response);	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // cuando entra desde el login, para no mostrar parametros por la url, usamos dopost (no queremos mostrar contraseña ni usuario)
		List<Usuario> usuarios=new ArrayList<Usuario>();
		UsuarioDaoImp usuarioImp= new UsuarioDaoImp();		
		usuarios= usuarioImp.getAll(); //pide todos los usuarios por medio del dao a la BD
		request.setAttribute("listaUsuarios", usuarios);
		request.getRequestDispatcher("administraUsuarios.jsp").forward(request, response);	
	}

}
