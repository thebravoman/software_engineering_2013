package org.elsys.se.class19_homework;

public class School {
	private String schoolAddress;
	private String schoolName;
	private int SchoolGSM;
	private SchoolTeacher[] teachers;
	private SchoolClass[] schoolClasses;
	
	public void setSchoolClasses(SchoolClass[] schoolClasses) {
		this.schoolClasses = schoolClasses;
	}

	public SchoolClass[] getSchoolClasses() {
		return schoolClasses;
	}
	public String getSchoolAddress() {
		return schoolAddress;
	}
	public void setSchoolAddress(String schoolAddress) {
		this.schoolAddress = schoolAddress;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public int getSchoolGSM() {
		return SchoolGSM;
	}
	public void setSchoolGSM(int schoolGSM) {
		SchoolGSM = schoolGSM;
	}
	public SchoolTeacher[] getTeacher() {
		return teachers;
	}
	public void setTeacher(SchoolTeacher[] teacher) {
		this.teachers = teacher;
	}
}
