package org.elsys;
import java.util.ArrayList;

import org.elsys.util.ContactInfo;

public class School {
	private String name;
	private String description;
	
	private ContactInfo contactInfo;
	
	private ArrayList<Teacher> teachers;
	private ArrayList<Student> students;
	private ArrayList<Subject> subjects;
	private ArrayList<Class> classes;
	
	public School(String name, String description, ContactInfo contactInfo) {
		super();
		this.name = name;
		this.description = description;
		this.contactInfo = contactInfo;
	}
	
	public int addTeacher(String name, ContactInfo contactInfo) {
		teachers.add(new Teacher(name,contactInfo));
		return Teacher.getLastId();
	}
	
	public int addStudent(String name, ContactInfo contactInfo, Class enclass) {
		students.add(new Student(name,contactInfo,enclass));
		return Student.getLastId();
	}
	
	public int addSubject(String name, String desc, boolean special) {
		subjects.add(new Subject(name,desc,special));
		return Subject.getLastId();
	}
	
	public int addClass(int grade, String letter, String specialization) {
		classes.add(new Class(grade,letter,specialization));
		return Class.getLastId();
	}
	
	
	
}
