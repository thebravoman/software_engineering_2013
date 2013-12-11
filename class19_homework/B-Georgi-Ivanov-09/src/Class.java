import java.util.Scanner;

public class Class {
	private String klas;
	private int numOfStudents;
	private Student[] students;
	
	// OTHER METHODS
	public void addClass(Class newClass){
		Scanner userInput = new Scanner(System.in);
		
		System.out.print("Please enter the new class: ");
		String newClassName = userInput.next();
		System.out.print("Please enter the number of students in the new class: ");
		int newClasstNumOfStudent = userInput.nextInt();
				
		newClass.setKlas(newClassName);
		newClass.setNumOfStudents(newClasstNumOfStudent);
	}
	
	public void addStudentToClass(Class studentsClass, Student newStudent){
		studentsClass.students[studentsClass.getNumberOfStudentsInClass(studentsClass)+1] = newStudent;
	}
	
	public int getNumberOfStudentsInClass(Class klas){
		return klas.students.length;
	}
	
	// GETTERS AND SETTERS
	public String getKlas() {
		return klas;
	}
	public void setKlas(String klas) {
		this.klas = klas;
	}
	public int getNumOfStudents() {
		return numOfStudents;
	}
	public void setNumOfStudents(int numOfStudets) {
		this.numOfStudents = numOfStudets;
	}
}
