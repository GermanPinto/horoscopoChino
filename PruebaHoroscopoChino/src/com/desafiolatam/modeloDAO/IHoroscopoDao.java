package com.desafiolatam.modeloDAO;

import com.desafiolaram.modelo.Horoscopo;

public interface IHoroscopoDao {

	public abstract void create();
	public abstract void update(Integer id);
	public abstract void delete(Integer id);
	public abstract void getAll();
	public abstract void getById(Integer id);
	public abstract Horoscopo findAnimal(Integer año);
	
}
