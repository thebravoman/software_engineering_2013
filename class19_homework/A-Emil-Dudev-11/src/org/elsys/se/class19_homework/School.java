package org.elsys.se.class19_homework;

import java.util.ArrayList;

public class School {
	private ArrayList<Class> classes;
	private ArrayList<Student> students;
	private ArrayList<Teacher> teachers;
	
	public School( ) {
		super();
		this.classes = new ArrayList<Class>();
		this.students = new ArrayList<Student>();
		this.teachers = new ArrayList<Teacher>();
	}
	
	public void addStudent(Student student, Class newClass ) {
		this.students.add(student);
		newClass.addStudent(student);
		student.setCurrentClass(newClass);
	}
	
	public void addTeacher(Teacher teacher) {
		this.teachers.add(teacher);
	}
	
}
