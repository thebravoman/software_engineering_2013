import java.util.Scanner;

public class Student {
	private String fullName;
	private String klas;
	private int numInClass;
	
	// OTHER METHODS
	public void addStudent(Student newStudent){
		Scanner userInput = new Scanner(System.in);
		
		System.out.print("Please enter the new student's name: ");
		String newStudentName = userInput.next();
		System.out.print("Please enter the new student's class: ");
		String newStudentClass = userInput.next();
		System.out.print("Please enter the new student's number in class: ");
		int newStudentNumInClass = userInput.nextInt();
		
		newStudent.setFullName(newStudentName);
		newStudent.setKlas(newStudentClass);
		newStudent.setNumInClass(newStudentNumInClass);
	}
	
	// GETTERS AND SETTERS
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String name) {
		this.fullName = name;
	}
	public String getKlas() {
		return klas;
	}
	public void setKlas(String klas) {
		this.klas = klas;
	}
	public int getNumInClass() {
		return numInClass;
	}
	public void setNumInClass(int numInClass) {
		this.numInClass = numInClass;
	}
}
