package org.elsys.se.class19_homework;

public class Student extends Person {
	private Class currentClass;

	public Student(String name, int age, Class currentClass) {
		super(name, age);
		this.currentClass = currentClass;
	}

	public Class getCurrentClass() {
		return currentClass;
	}
	
	public void setCurrentClass(Class newClass) {
		this.currentClass = newClass;
	}
}
