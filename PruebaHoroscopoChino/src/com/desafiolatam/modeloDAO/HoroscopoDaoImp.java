package com.desafiolatam.modeloDAO;

import java.sql.SQLException;

import com.desafiolaram.modelo.Horoscopo;
import com.desafiolatam.procesaConexion.AdministradorConexion;

public class HoroscopoDaoImp extends AdministradorConexion implements IHoroscopoDao {
	
	public HoroscopoDaoImp() {
		con = generaConexion();
	}

	@Override
	public void create() {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(Integer id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void getAll() {
		// TODO Auto-generated method stub

	}

	@Override
	public void getById(Integer id) {
		// TODO Auto-generated method stub

	}

	@Override
	public Horoscopo findAnimal(Integer año) {
		Horoscopo horoscopo = null;
		String sql = "select h.cod_animal, h.nom_animal,h.desc_animal from horoscopo h inner join anio_animal a on h.cod_animal= a.cod_animal_h where a.anio='"+año+"'";
		try {
			ps =con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				horoscopo = new Horoscopo(rs.getString("COD_ANIMAL"), rs.getString("NOM_ANIMAL"),
						rs.getString("DESC_ANIMAL"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return horoscopo;
	}

}
