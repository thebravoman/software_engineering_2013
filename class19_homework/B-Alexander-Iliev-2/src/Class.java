import java.util.ArrayList;


public class Class {
	public int number_of_students;
	public int grade;
	public int div;
	public Teacher class_teacher;
	public ArrayList<Student> students;
	
	
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getDiv() {
		return div;
	}
	public void setDiv(int div) {
		this.div = div;
	}
	public ArrayList<Student> getStudents() {
		return students;
	}
	public void setStudents(ArrayList<Student> students) {
		this.students = students;
	}
	public int getNumber_of_students() {
		return number_of_students;
	}
	public void setNumber_of_students(int number_of_students) {
		this.number_of_students = number_of_students;
	}
	public Teacher getClass_teacher() {
		return class_teacher;
	}
	public void setClass_teacher(Teacher class_teacher) {
		this.class_teacher = class_teacher;
	}
	
}
