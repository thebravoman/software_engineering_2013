package org.elsys.homework;

public class School {
	private int numberOfClasses;
	private Class[] classes = new Class[10];
	private String name;
	private String address;
	
	School() {
		numberOfClasses = 0;
	}
	
	public int getNumberOfClasses() {
		return numberOfClasses;
	}
	public void setNumber_of_classes(int numberOfClasses) {
		this.numberOfClasses = numberOfClasses;
	}
	public Class getClass(int number){
		return classes[number];
	}
	public void addClass(Class claass){
		classes[numberOfClasses] = claass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
