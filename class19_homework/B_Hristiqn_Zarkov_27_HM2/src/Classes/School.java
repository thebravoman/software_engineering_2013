package Classes;

import java.util.ArrayList;

public class School {
	private String name;
	private String address;
	private ArrayList<Student> students = new ArrayList<Student>();
	private ArrayList<Teacher> teachers = new ArrayList<Teacher>();

	public School(String name) {
		setName(name);
	}
	private void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Student getStudent(int id) {
		return students.get(id);
	}
	public void setStudent(Student student) {
		this.students.add(student);
	}
	public Teacher getTeacher(int id) {
		return teachers.get(id);
	}
	public void setTeacher(Teacher teacher) {
		this.teachers.add(teacher);
	}
	public int teachersSize() {
		return teachers.size();
	}
	public int studentsSize() {
		return students.size();
	}
}
