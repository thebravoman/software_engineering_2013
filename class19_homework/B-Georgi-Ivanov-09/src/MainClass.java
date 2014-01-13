import java.util.Scanner;

public class MainClass {
	public static void main(String[] args) {
		Scanner userInput = new Scanner(System.in);
		
		School school = new School(); // Works only with 1 school for now...
		
		int choice = 99;
		while(choice != 0){
			System.out.println("MENU:");
			System.out.println("01. Add Student");
			System.out.println("02. Add Teacher");
			System.out.println("03. Add Class");
			System.out.println("--------------------");
			System.out.println("04. See all students");
			System.out.println("05. See all teachers");
			System.out.println("06. See all classes");
			System.out.println("--------------------");
			System.out.println("00. Exit");
		
			choice = userInput.nextInt();
			if(choice == 1){ // Add Student
				Student newStudent = new Student();
				newStudent.addStudent(newStudent);
				String newStudentsClass = newStudent.getKlas();
				school.addStudent(school, newStudent);
				
			}else if(choice == 2){ // Add Teacher
				Teacher newTeacher = new Teacher();
				newTeacher.addTeacher(newTeacher);
				school.addTeacher(school, newTeacher);
				
			}else if(choice == 3){ // Add Class
				Class newClass = new Class();
				newClass.addClass(newClass);
				school.addClass(school, newClass);
				
			}else if(choice == 4){ // See all students
				school.seeAllStudents(school);
				
			}else if(choice == 5){ // See all teachers
				school.seeAllTeachers(school);
				
			}else if(choice == 6){ // See all classes
				school.seeAllClasses(school);
				
			}else if(choice == 0){ // Exit
				System.out.println("Exiting program...");
			}
		}
	}
}
