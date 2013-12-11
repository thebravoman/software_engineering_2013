package elsys;

import java.util.ArrayList;

public class Class {
	public int number_of_students;
	public int getNumber_of_students() {
		return number_of_students;
	}
	public void setNumber_of_students(int number_of_students) {
		this.number_of_students = number_of_students;
	}
	public ArrayList<Student> getStudents() {
		return students;
	}
	public void setStudents(ArrayList<Student> students) {
		this.students = students;
	}
	public String getClass_letter() {
		return class_letter;
	}
	public void setClass_letter(String class_letter) {
		this.class_letter = class_letter;
	}
	public ArrayList<Student> students; ;
	public String class_letter;
	
	
}
