import java.util.*;

public class SchoolTestDrive {

	static Scanner input = new Scanner(System.in);
	
	public static void main(String[] args) {
		School tues = new School("TUES", "Mladost 1");
		System.out.println(tues);
		
		Teacher bobinata = new Teacher("Valentin Ivanov", "Electronic circuits", "male");
		
		Class eleven_b = new Class();
		eleven_b.setGrade("11b");
		eleven_b.setClassTeacher(bobinata);
		
		System.out.println(eleven_b.getGrade() + ", class teacher: " + bobinata);
		
		String answer = new String();
		while(!answer.equals("n")) {
			System.out.println("Would you like to enter a new student to class" + eleven_b.getGrade() + " (y / n)?");
			answer = input.nextLine();
			if(answer.equals("y")) {
				Student s = new Student();
				System.out.println("Enter student's names: ");
				answer = input.nextLine();
				s.setName(answer);
				System.out.println("Enter student's gender: ");
				answer = input.nextLine();
				s.setGender(answer);
				System.out.println("Enter student's number in class: ");
				int number = input.nextInt();
				s.setNumberInClass(number);
				eleven_b.addStudent(s);
			}
		}
		
		System.out.println("Would you like to see the students in " + eleven_b + " (y / n) ?");
		answer = input.nextLine();
		if(answer.equals("y")) {
			for(int i = 0; i < eleven_b.getStudentsSize(); i++) {
				System.out.println(eleven_b.getStudent(i));
			}
		}
	}
}
