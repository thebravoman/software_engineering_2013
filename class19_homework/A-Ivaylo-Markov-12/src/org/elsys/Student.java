package org.elsys;
import java.util.ArrayList;

import org.elsys.util.ContactInfo;

public class Student extends Person {
	private static int id = 0;
	private Class enrolledClass;
	private ArrayList<Grade> grades;
	
	public Student(String name, ContactInfo contactInfo, Class enclass) {
		++id;
		this.name = name;
		this.contactInfo = contactInfo;
		this.enrolledClass = enclass;
	}
	
	public static int getLastId() {
		return id;
	}
	
	public Class getEnrolledClass() {
		return enrolledClass;
	}
	
	public void setEnrolledClass(Class enrolledClass) {
		this.enrolledClass = enrolledClass;
	}
	
	public ArrayList<Grade> getGrades() {
		return grades;
	}
	
	public int addGrade(int mark, Subject subject,String date, String reason) {
		grades.add(new Grade(mark,subject,date,reason));
		return Grade.getLastId();
	}
	
	
}
