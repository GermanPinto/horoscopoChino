package com.desafiolatam.modeloDAO;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.desafiolaram.modelo.Usuario;
import com.desafiolatam.procesaConexion.AdministradorConexion;

public class UsuarioDaoImp extends AdministradorConexion implements IUsuarioDao {

	public UsuarioDaoImp() {
		con = generaConexion();
	}

	@Override
	public void create(Usuario usuario) {
		String sqlSec = "select SEC_USUARIO_HOROSCOPO.NEXTVAL from DUAL";
		int nextID_from_seq = 0;
		try {
			ps = con.prepareStatement(sqlSec);
			rs = ps.executeQuery();
		if(rs.next()) {
		     nextID_from_seq = rs.getInt(1);
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		

		String fechaComoCadena = new SimpleDateFormat("dd-MM-yyyy").format(usuario.getFechaNacimiento().getTime());
		int esAdmin= usuario.isEsAdmin()?1:0;
		
		//Usuario(int id, String nombre, String apellido, String email, Date fechaNacimiento, String nombreUsuario, String contraseña, boolean esAdmin) 
		String sql=  "INSERT INTO USUARIO VALUES("+nextID_from_seq+",'"+usuario.getNombre()+"','"+usuario.getApellido()+"','"+usuario.getEmail()+"','"+fechaComoCadena+"','"+usuario.getNombreUsuario()+"','"+usuario.getContraseña()+"','"+esAdmin+"')";
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

	@Override
	public void update(Usuario usuario) {
		
		String fechaComoCadena = new SimpleDateFormat("dd-MM-yyyy").format(usuario.getFechaNacimiento().getTime());
		int esAdmin= usuario.isEsAdmin()?1:0;

		String sql = "update usuario set NOMBRE='" + usuario.getNombre() + "',APELLIDO='" + usuario.getApellido()
				+ "',EMAIL='" + usuario.getEmail() + "',FECHA_NACIMIENTO='" + fechaComoCadena
				+ "', NOMBRE_USUARIO='" + usuario.getNombreUsuario() + "',CONTRASENA='" + usuario.getContraseña()
				+ "',IS_ADMIN='" +esAdmin+ "' where id='"+usuario.getId()+"'";

		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
    private static java.sql.Date convert(java.util.Date uDate) {
        java.sql.Date sDate = new java.sql.Date(uDate.getTime());
        return sDate;
    }

	@Override
	public void delete(Integer id) {
		String sql = "delete from usuario where id="+id;
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Usuario> getAll() {

		List<Usuario> usuarios = new ArrayList<Usuario>();
		String sql = "select * from usuario";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				Usuario usuario = new Usuario(rs.getInt("ID"), rs.getString("NOMBRE"), rs.getString("APELLIDO"),
						rs.getString("EMAIL"), rs.getDate("FECHA_NACIMIENTO"), rs.getString("NOMBRE_USUARIO"),
						rs.getString("CONTRASENA"), rs.getBoolean("IS_ADMIN"));
				usuarios.add(usuario);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return usuarios;

	}

	@Override
	public Usuario getById(Integer id) {
		String sql = "select * from usuario where id="+id;
		Usuario usuario=null;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				 usuario = new Usuario(rs.getInt("ID"), rs.getString("NOMBRE"), rs.getString("APELLIDO"),
						rs.getString("EMAIL"), rs.getDate("FECHA_NACIMIENTO"), rs.getString("NOMBRE_USUARIO"),
						rs.getString("CONTRASENA"), rs.getBoolean("IS_ADMIN"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usuario;
	}

	@Override
	public Usuario findUsuario(String nombreUsuario, String contrasena) {
		Usuario usuario = null;
		String sql = "select * from usuario where nombre_usuario='" + nombreUsuario + "' and contrasena='" + contrasena
				+ "'";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				usuario = new Usuario(rs.getInt("ID"), rs.getString("NOMBRE"), rs.getString("APELLIDO"),
						rs.getString("EMAIL"), rs.getDate("FECHA_NACIMIENTO"), rs.getString("NOMBRE_USUARIO"),
						rs.getString("CONTRASENA"), rs.getBoolean("IS_ADMIN"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return usuario;
	}

	@Override
	public Usuario findUsuario(String nombreoUsuariooNombreoApellido) {
		Usuario usuario = null;
	
		String sql = "select * from usuario where nombre_usuario like '%"+ nombreoUsuariooNombreoApellido+ "%'or upper(nombre) like upper('%"+ nombreoUsuariooNombreoApellido
				+ "%') or upper(apellido) like upper('%"+ nombreoUsuariooNombreoApellido+"')";
		System.out.println("UsuarioDaoImp: "+sql);
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				usuario = new Usuario(rs.getInt("ID"), rs.getString("NOMBRE"), rs.getString("APELLIDO"),
						rs.getString("EMAIL"), rs.getDate("FECHA_NACIMIENTO"), rs.getString("NOMBRE_USUARIO"),
						rs.getString("CONTRASENA"), rs.getBoolean("IS_ADMIN"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return usuario;
	}

}
