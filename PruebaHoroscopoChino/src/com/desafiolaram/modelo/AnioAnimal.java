package com.desafiolaram.modelo;

public class AnioAnimal {
	private String año;
	private String codAnimal;

	public AnioAnimal(String año, String codAnimal) {
		this.año = año;
		this.codAnimal = codAnimal;
	}

	public String getAño() {
		return año;
	}

	public void setAño(String año) {
		this.año = año;
	}

	public String getCodAnimal() {
		return codAnimal;
	}

	public void setCodAnimal(String codAnimal) {
		this.codAnimal = codAnimal;
	}

}
