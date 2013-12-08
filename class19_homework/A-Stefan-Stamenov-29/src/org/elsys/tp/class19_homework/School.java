package org.elsys.tp.class19_homework;

public class School {

	private String name;
	private String addres;
	private String conntact;
	private int numberOfClasses;
	private Class[] classes=new Class[10];
	
	School(){
		numberOfClasses =0 ;
		
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddres() {
		return addres;
	}

	public void setAddres(String addres) {
		this.addres = addres;
	}

	public String getConntact() {
		return conntact;
	}

	public void setConntact(String conntact) {
		this.conntact = conntact;
	}
	
	public int getNumberOfClasses() {
		return numberOfClasses;
	}

	public void setNumberOfClasses(int numberOfClasses) {
		this.numberOfClasses = numberOfClasses;
	}

	public Class[] getClasses() {
		return classes;
	}

	public void setClasses(Class[] classes) {
		this.classes = classes;
	}
	
}
