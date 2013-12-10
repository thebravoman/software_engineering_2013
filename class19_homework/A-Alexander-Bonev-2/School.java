package org.elsys.alexander.bonev;

public class School {

	private Students[] students = new Students[500];
	private Teacher[] teachers = new Teacher[50];
	private String name;
	private String address;
		
	
	public Students[] getStudents() {
		return students;
	}
	public void setStudents(Students[] students) {
		this.students = students;
	}
	public Teacher[] getTeachers() {
		return teachers;
	}
	public void setTeachers(Teacher[] teachers) {
		this.teachers = teachers;
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
