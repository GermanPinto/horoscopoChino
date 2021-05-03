package com.desafiolatam.controladorServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.desafiolatam.modeloDAO.UsuarioDaoImp;


@WebServlet("/ProcesaElimina")
public class ProcesaElimina extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ProcesaElimina() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String idUsuarioseleccionado =  (String)request.getParameter("idUsuarioseleccionado");
    	
		UsuarioDaoImp usuarioImp= new UsuarioDaoImp();		
		usuarioImp.delete(Integer.parseInt(idUsuarioseleccionado));
		
		request.getRequestDispatcher("/AdministraUsuario").forward(request, response);

    }
    
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
