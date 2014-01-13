package org.elsys.School;

public class Student {
	Personal_info pi;
	String name;
	int num_in_class;
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
	public int getNumInClass() {
		return num_in_class;
	}
	public void setNumInClass(int numInClass) {
		this.num_in_class = numInClass;
	}
}
