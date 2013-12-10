package org.elsys.School;

import java.util.ArrayList;
import java.util.List;

public class School {
	String name;
	String desc;
	Headmaster hm;
	List<Teacher> teachers;
	List<Class> classes;
	List<Subject> availSubjects;
	
	School(){
		teachers = new ArrayList<Teacher>();
		classes = new ArrayList<Class>();
		availSubjects = new ArrayList<Subject>();
	}
	void setHeadmaster(Headmaster hm){
		this.hm = hm;
	}
	void setDescription(String desc){
		this.desc = desc;
	}
	void setSchoolName(String name){
		this.name = name;
	}
	void addTeacher(Teacher t){
		teachers.add(t);
	}
	void addClass(Class c){
		classes.add(c);
	}
	void addSubject(Subject s){
		availSubjects.add(s);
	}
}
