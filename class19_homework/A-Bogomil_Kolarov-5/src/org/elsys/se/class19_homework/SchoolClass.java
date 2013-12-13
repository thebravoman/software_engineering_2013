package org.elsys.se.class19_homework;

public class SchoolClass {
	private String id;
	private String classTeacher;
	private int numberOfStudents;
	private ClassStudents[] students;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getClassTeacher() {
		return classTeacher;
	}
	public void setClassTeacher(String classTeacher) {
		this.classTeacher = classTeacher;
	}
	public int getNumberOfStudents() {
		return numberOfStudents;
	}
	public void setNumberOfStudents(int numberOfStudents) {
		this.numberOfStudents = numberOfStudents;
	}
	public ClassStudents[] getStudents() {
		return students;
	}
	public void setStudents(ClassStudents[] students) {
		this.students = students;
	}
}
