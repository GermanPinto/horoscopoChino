package com.desafiolatam.controladorServlet;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.desafiolaram.modelo.Horoscopo;
import com.desafiolatam.modeloDAO.HoroscopoDaoImp;

@WebServlet("/ProcesaConsultaSigno")
public class ProcesaConsultaSigno extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProcesaConsultaSigno() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Date fechaUsuario= (Date) request.getAttribute("fechaUsuario");
		
	    // create a calendar
        Calendar cal = Calendar.getInstance();
        cal.setTime(fechaUsuario);  //use java.util.Date object as arguement
        // get the value of all the calendar date fields.
        int año= cal.get(Calendar.YEAR);

		
		HoroscopoDaoImp horoscopoDao = new HoroscopoDaoImp();
		Horoscopo horoscopo = new Horoscopo();
		horoscopo= horoscopoDao.findAnimal(año);
		
		request.setAttribute("horoscopoSeleccionado", horoscopo);	
		request.getRequestDispatcher("indexConsultaHoroscopo.jsp").forward(request, response);			
	}

}
