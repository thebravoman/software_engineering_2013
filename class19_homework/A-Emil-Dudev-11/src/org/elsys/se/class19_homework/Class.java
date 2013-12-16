package org.elsys.se.class19_homework;

import java.util.ArrayList;

public class Class {
	private ArrayList<Student> students;
	private int grade;
	private char division;

	public Class(int grade, char division) {
		super();
		this.grade = grade;
		this.division = division;
		this.students = new ArrayList<Student>();
	}

	public int getGrade() {
		return grade;
	}

	public void incrementGrade(int grade) {
		++this.grade;
	}

	public ArrayList<Student> getStudents() {
		return students;
	}
	
	public void addStudent(Student student) {
		students.add(student);
	}

	public char getDivision() {
		return division;
	}
	
}
