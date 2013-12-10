package org.elsys.School;

import java.util.ArrayList;
import java.util.List;

public class Class {
	List<Student> studentsInClass;
	List<Grade> grades;
	
	Class(){
		studentsInClass = new ArrayList<Student>();
		grades = new ArrayList<Grade>();
		
	}
	public void addStudent(Student s){
		studentsInClass.add(s);
	}
	public List<Student> getStudentsInClass() {
		return studentsInClass;
	}
	public void addGrade(Grade g){
		grades.add(g);
	}
	protected List<Grade> getGrades() {
		return grades;
	}
	
}
