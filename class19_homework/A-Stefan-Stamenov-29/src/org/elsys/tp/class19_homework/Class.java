package org.elsys.tp.class19_homework;

public class Class {

	private int studentsInClass;
	private char letter;
	private Teacher classTeacher;
	private Student[] students=new Student[29];
	
	Class(){
		studentsInClass=0;
		
	}
	
	
	
	
	public int getStudentsInClass() {
		return studentsInClass;
	}
	public void setStudentsInClass(int studentsInClass) {
		this.studentsInClass = studentsInClass;
	}
	public char getLetter() {
		return letter;
	}
	public void setLetter(char letter) {
		this.letter = letter;
	}
	public Teacher getClassTeacher() {
		return classTeacher;
	}
	public void setClassTeacher(Teacher classTeacher) {
		this.classTeacher = classTeacher;
	}
	public Student[] getStudents() {
		return students;
	}
	public void setStudents(Student[] students) {
		this.students = students;
	}
	
	
	
	}
