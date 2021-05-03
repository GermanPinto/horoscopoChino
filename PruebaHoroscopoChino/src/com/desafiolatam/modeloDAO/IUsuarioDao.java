package com.desafiolatam.modeloDAO;

import java.util.List;

import com.desafiolaram.modelo.Usuario;

public interface IUsuarioDao {
	
	public abstract void create(Usuario usuario);
	public abstract void update(Usuario usuario);
	public abstract void delete(Integer id);
	public abstract List<Usuario> getAll();
	public abstract Usuario getById(Integer id);
	public abstract Usuario findUsuario(String nombreUsuario, String contrasena);
	public abstract Usuario findUsuario(String nombreUsuario);
	

}
