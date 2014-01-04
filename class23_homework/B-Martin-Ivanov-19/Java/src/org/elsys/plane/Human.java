package org.elsys.plane;

public class Human {
	private String gender;
	
	public Human(String gender){
		this.gender = gender;
	}
	
	public Human(){
		this.gender = "m";
	}
	
	public String getGender() {
		return gender;
	}
	
}
