package org.elsys.homework;

import java.util.ArrayList;

public class school {
	private  String name;
	private address schooladdress;
	private  ArrayList<Class> classes;
	private  ArrayList<Teacher> teachers;
	
	public school(){
		this.classes = new ArrayList<Class>();
		this.teachers = new ArrayList<Teacher>();
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public address getSchooladdress() {
		return schooladdress;
	}
	public void setSchoolstreet(String street) {
		this.schooladdress.setStreet(street);
	}
	public void setSchoolPostcode(int code) {
		this.schooladdress.setPostcode(code);
	}

	public ArrayList<Class> getClasses() {
		return classes;
	}

	public void addClass(Class class_) {
		this.classes.add(class_);
	}

	public ArrayList<Teacher> getTeachers() {
		return teachers;
	}

	public void addTeacher(Teacher teacher) {
		this.teachers.add(teacher);
	}
	
	
	
}
