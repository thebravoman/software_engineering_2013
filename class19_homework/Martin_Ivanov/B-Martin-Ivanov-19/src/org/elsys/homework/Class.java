package org.elsys.homework;

public class Class {
	
	private int studentsInClass;
	private String name;
	private Teacher classTeacher;
	private Student[] students = new Student[20];
	
	Class() {
		studentsInClass = 0;
	}
	
	public int getStudentsInClass() {
		return studentsInClass;
	}
	public void setStudentsInClass(int studentsInClass) {
		this.studentsInClass = studentsInClass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getClassTeacher() {
		return classTeacher.getName();
	}
	public void setClassTeacher(Teacher classTeacher) {
		this.classTeacher = classTeacher;
	}
	public void addStudent(Student student){
		students[studentsInClass] = student ;
	}
	public Student getStudent(int number){
		return students[number];		
	}
	public void printStudents() {
		for (int i = 0; i < students.length; i++) {
			System.out.println(students[i].getName());
		}
	}
	
}
