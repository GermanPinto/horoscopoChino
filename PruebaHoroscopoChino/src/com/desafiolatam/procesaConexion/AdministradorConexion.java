package com.desafiolatam.procesaConexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdministradorConexion {
	
	protected Connection con = null;
	protected PreparedStatement ps= null;
	protected ResultSet rs=null;
	
	protected Connection generaConexion() {
		String user = "ADMIN_HOROSCOPO";
		String password = "1234"; 
		//para mySql sería driver="com.mysql.jdbc.Driver" 
		String driver ="oracle.jdbc.driver.OracleDriver";
		String url ="jdbc:oracle:thin:@//localhost:1521/xe";
		
		try {
			//levantar driver (en este caso Oracle)/ Carga en tiempo de ejecucion driver con la ruta especificada
			Class.forName(driver);
			//establecemos conexion
			con = DriverManager.getConnection(url, user, password);		
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}	
		return con;
	}

}
