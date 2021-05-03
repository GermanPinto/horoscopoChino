package com.desafiolaram.modelo;

import java.util.List;

public class Horoscopo {
	private String codAnimal;
	private String nomAnimal;
	private String descAnimal;
	private List<AnioAnimal> años;
	
	public Horoscopo() {
	}

	public Horoscopo(String codAnimal, String nomAnimal, String descAnimal, List<AnioAnimal> años) {
		this.codAnimal = codAnimal;
		this.nomAnimal = nomAnimal;
		this.descAnimal = descAnimal;
		this.años = años;
	}
	
	
	public Horoscopo(String codAnimal, String nomAnimal, String descAnimal) {
		this.codAnimal = codAnimal;
		this.nomAnimal = nomAnimal;
		this.descAnimal = descAnimal;
	}


	public String getCodAnimal() {
		return codAnimal;
	}

	public void setCodAnimal(String codAnimal) {
		this.codAnimal = codAnimal;
	}

	public String getNomAnimal() {
		return nomAnimal;
	}

	public void setNomAnimal(String nomAnimal) {
		this.nomAnimal = nomAnimal;
	}

	public String getDescAnimal() {
		return descAnimal;
	}

	public void setDescAnimal(String descAnimal) {
		this.descAnimal = descAnimal;
	}

	public List<AnioAnimal> getAños() {
		return años;
	}

	public void setAños(List<AnioAnimal> años) {
		this.años = años;
	}

	@Override
	public String toString() {
		return "Horoscopo [codAnimal=" + codAnimal + ", nomAnimal=" + nomAnimal + ", descAnimal=" + descAnimal
				+ ", años=" + años + "]";
	}
	
	

}
