import java.util.*;

public class Class {
	private String grade;
	private ArrayList<Student> students = new ArrayList<Student>();
	private Teacher classTeacher;
	
	public String toString() {
		return this.grade;
	}
	
	public String getGrade() {
		return this.grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	public void setClassTeacher(Teacher t) {
		classTeacher = t;
	}
	
	public String getClassTeacher() {
		return this.classTeacher.toString();
	}
	
	public void addStudent(Student s) {
		students.add(s);
	}
	
	public Student getStudent(int s) {
		return this.students.get(s);
	}
	
	public int getStudentsSize() {
		return this.students.size();
	}
}
