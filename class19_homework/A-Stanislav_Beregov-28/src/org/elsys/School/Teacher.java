package org.elsys.School;

public class Teacher {
	Personal_info pi;
	String name;
	String subject_name;
	protected boolean priviledged;
	Teacher(){
		priviledged = false;
	}
	public Personal_info getPi() {
		return pi;
	}
	public void setPi(Personal_info pi) {
		this.pi = pi;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject_name() {
		return subject_name;
	}
	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}
}
