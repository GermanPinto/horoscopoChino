package com.desafiolatam.controladorServlet;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.desafiolaram.modelo.Usuario;
import com.desafiolatam.modeloDAO.UsuarioDaoImp;




/**
 * Servlet implementation class AgregarUsuario
 */
@WebServlet("/AgregarUsuario")
public class AgregarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AgregarUsuario() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nombreAdd=request.getParameter("nombreAdd");
		String apellidoAdd=request.getParameter("apellidoAdd");
		String emailAdd=request.getParameter("emailAdd");
		String fechaAdd=request.getParameter("fechaAdd");
		 Date fecha = ParseFecha(fechaAdd); //sql.Date
		String nombreUsuarioAdd=request.getParameter("nombreUsuarioAdd");
		String contrasenaAdd=request.getParameter("contrasenaAdd");
			
		Usuario usuario =null;
		//mandamos con el id 0 mientras, pero luego en el dao le agregamos el siguiente index de la secuenci en bd.
	    usuario = new Usuario(0,nombreAdd,apellidoAdd,emailAdd,fecha,nombreUsuarioAdd,contrasenaAdd,false);
	    
	    UsuarioDaoImp usuarioDaoImp= new UsuarioDaoImp();	
	    usuarioDaoImp.create(usuario);
		
	    request.getRequestDispatcher("/AdministraUsuario").forward(request, response);
				
	}
	
    public static Date ParseFecha(String fecha)
    {
    	SimpleDateFormat formato=null;
    	if(fecha.charAt(4)=='-') {
    	//el formato que usamos "yyyy-MM-dd", es que que trae el tipo imput date del dom (imput typo date con calendario), por eso lo dejamos asi al transformarlo a date
    	formato = new SimpleDateFormat("yyyy-MM-dd");
    	}else {
        //el formato que usamos "dd-MM-yyyy", es que que trae el tipo imput date del dom, entregado por el usuario sin calendario
        formato = new SimpleDateFormat("dd-MM-yyyy");
    	}
    	java.util.Date fechaDate = null;
		try {
			fechaDate =  formato.parse(fecha);
		} catch (ParseException e) {
			e.printStackTrace();
		}
        java.sql.Date sqlDate = new java.sql.Date(fechaDate.getTime());
        return sqlDate;
    } 

}
