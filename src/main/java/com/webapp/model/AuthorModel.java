package com.webapp.model;

public class AuthorModel extends AbstractModel<AuthorModel>{
	private String name;
	private String nationality;
	
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	
}
		