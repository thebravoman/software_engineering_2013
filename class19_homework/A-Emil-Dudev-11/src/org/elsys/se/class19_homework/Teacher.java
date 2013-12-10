package org.elsys.se.class19_homework;
import java.util.ArrayList;

public class Teacher extends Person {
	private ArrayList<String> subjects;
	private Class currentClass;
	
	public Teacher(String name, int age) {
		super(name, age);
		subjects = new ArrayList<String>();
		currentClass = null;
	}

	public Class getCurrentClass() {
		return currentClass;
	}

	public void setCurrentClass(Class currentClass) {
		this.currentClass = currentClass;
	}

	public ArrayList<String> getSubjects() {
		return subjects;
	}

	public void addSubject(String subject) {
		subjects.add(subject);
	}
	
}
