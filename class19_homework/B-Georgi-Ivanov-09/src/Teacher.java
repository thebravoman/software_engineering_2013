import java.util.Scanner;

public class Teacher {
	private String fullName;
	private int age;
	private String subject;
	
	// OTHER METHODS
	public void addTeacher(Teacher newTeacher){
		Scanner userInput = new Scanner(System.in);
		
		System.out.print("Please enter the new teacher's name: ");
		String newTeachertName = userInput.next();
		System.out.print("Please enter the new teacher's age: ");
		int newTeacherAge = userInput.nextInt();
		System.out.print("Please enter the subject which the teacher teaches: ");
		String newTeacherSubject = userInput.next();
		
		newTeacher.setFullName(newTeachertName);
		newTeacher.setAge(newTeacherAge);
		newTeacher.setSubject(newTeacherSubject);
	}
	
	// GETTERS AND SETTERS
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
}
