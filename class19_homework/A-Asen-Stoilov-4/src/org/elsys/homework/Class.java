package org.elsys.homework;

import java.util.ArrayList;

public class Class {

	private ArrayList<Student> students;
	private String name;
	
	public Class(){
		this.students = new ArrayList<Student>();
	}
	
	public ArrayList<Student> getStudents() {
		return students;
	}
	public void addStudent(Student student) {
		this.students.add(student);
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
	
	
	
	
}
