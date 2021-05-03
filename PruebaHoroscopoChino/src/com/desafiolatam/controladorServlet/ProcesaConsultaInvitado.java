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

@WebServlet("/ProcesaConsultaInvitado")
public class ProcesaConsultaInvitado extends HttpServlet{
	
	public ProcesaConsultaInvitado() {

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("fechaUsuario", ParseFecha((String)request.getParameter("ingresafechaInvitado")));
		request.getRequestDispatcher("ProcesaConsultaSigno").forward(request, response);
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
