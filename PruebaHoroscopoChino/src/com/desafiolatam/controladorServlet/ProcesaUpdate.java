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
 * Servlet implementation class ProcesaUpdate
 */
@WebServlet("/ProcesaUpdate")
public class ProcesaUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProcesaUpdate() {

    }
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String idUsuarioseleccionado =  request.getParameter("idUsuarioseleccionado");
	request.setAttribute("idUsuarioseleccionado",idUsuarioseleccionado);
	request.getRequestDispatcher("editarUsuario.jsp").forward(request, response);
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 // obtengo los datos del formulario
		  int id= Integer.parseInt((String)request.getParameter("idEdit"));
	      String nombre = (String)request.getParameter("nombreEdit");
	      String apellido = (String)request.getParameter("apellidoEdit");
	      String email = (String)request.getParameter("emailEdit");
	      String fechaCapturada= (String)request.getParameter("fechaEdit");
	      Date fecha = ParseFecha(fechaCapturada);
	      String nombreUsuario = (String)request.getParameter("nombreUsuarioEdit");
	      String contresena = (String)request.getParameter("contrasenaEdit");
	      boolean esAdmin = (((String)request.getParameter("esAdminEdit"))=="1")?true:false;

	      Usuario usuario = null;
	      usuario = new Usuario(id,nombre,apellido,email,fecha,nombreUsuario,contresena,esAdmin);
	      UsuarioDaoImp usuarioImp= new UsuarioDaoImp();	
	      usuarioImp.update(usuario);

	      request.getRequestDispatcher("/AdministraUsuario").forward(request, response);	
	      
	}
	
    public static Date ParseFecha(String fecha)
    {
    	//el formato que usamos "yyyy-MM-dd", es que que trae el tipo imput date del dom, por eso lo dejamos asi al transformarlo a date
    	SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
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
