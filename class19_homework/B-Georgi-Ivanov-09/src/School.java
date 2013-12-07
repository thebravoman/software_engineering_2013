import java.util.Scanner;

public class School {
	private String name;
	private String address;
	private int phoneNumber;
	private Student[] students = new Student[100];
	private Teacher[] teachers = new Teacher[100];
	private Class[] classes = new Class[100];
	
	private int studentsCount = 0;
	private int teachersCount = 0;
	private int classesCount = 0;
		
	// OTHER METHODS
	public void addStudent(School school, Student newStudent){
		school.studentsCount++;
		school.students[school.studentsCount] = newStudent;
	}
	
	public void addTeacher(School school, Teacher newTeacher){
		teachersCount++;
		school.teachers[school.teachersCount] = newTeacher;
	}
	
	public void addClass(School school, Class newClass){
		school.classes[school.classesCount] = newClass;
	}
	
	public void seeAllStudents(School school){
		for(int i = 1; i <= studentsCount; i++){
			System.out.println(school.students[i].getFullName() + ", " + school.students[i].getKlas() + " class,  Num:" + school.students[i].getNumInClass());
		}
	}
	
	public void seeAllTeachers(School school){
		for(int i = 1; i <= teachersCount; i++){
			System.out.println(school.teachers[i].getFullName() + ", " + school.teachers[i].getAge() + " years old,  Subject:" + school.teachers[i].getSubject());
		}
	}
	
	public void seeAllClasses(School school){
		for(int i = 1; i <= classesCount; i++){
			System.out.println(school.classes[i].getKlas() + ", " + school.classes[i].getNumberOfStudentsInClass(school.classes[i]));
		}
	}
	
	// GETTER AND SETTERS
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(int phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
}
