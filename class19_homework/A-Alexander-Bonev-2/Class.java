package org.elsys.alexander.bonev;

public class Class {

	private String nameOfClass;
	private Students[] studentsInClass = new Students[28];
	private String classTeacherName;
	
	
	public String getNameOfClass() {
		return nameOfClass;
	}
	public void setNameOfClass(String nameOfClass) {
		this.nameOfClass = nameOfClass;
	}
	public Students[] getStudentsInClass() {
		return studentsInClass;
	}
	public void setStudentsInClass(Students[] studentsInClass) {
		this.studentsInClass = studentsInClass;
	}
	public String getClassTeacherName() {
		return classTeacherName;
	}
	public void setClassTeacherName(String classTeacherName) {
		this.classTeacherName = classTeacherName;
	}
	
}
