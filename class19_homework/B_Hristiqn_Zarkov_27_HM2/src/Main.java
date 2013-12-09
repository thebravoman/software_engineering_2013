
import Classes.School;
import Classes.Student;
import Classes.Teacher;

public class Main {
	public static void main(String[] args) {
		School school = new School("ELSYS");
		school.setAddress("Sofia, Mladost-1");
		
		Teacher teacher = new Teacher("Emil Gotsev");
		teacher.setAge(21);
		teacher.setSex("Mele");
		teacher.setSubject("TP");
		school.setTeacher(teacher);
		
		Student student = new Student("Hristiqn Zarkov");
		student.setAge(17);
		student.setId(27);
		student.setGrade("11b");
		school.setStudent(student);
		
		student = new Student("Georgi Ivanov");
		student.setAge(17);
		student.setId(9);
		student.setGrade("11b");
		school.setStudent(student);
		
		teacher = new Teacher("Milko Bozhilov");
		teacher.setAge(24);
		teacher.setSex("Mele");
		teacher.setSubject("IT");
		school.setTeacher(teacher);
		System.out.println("School Name: "+school.getName());
		System.out.println("School Address: "+school.getAddress());
		System.out.println("Teachers: ");
		for (int i = 0; i < school.teachersSize(); i++) {
			System.out.println("Name: "+school.getTeacher(i).getName());
			System.out.println("Age: "+school.getTeacher(i).getAge());
			System.out.println("Subject: "+school.getTeacher(i).getSubject());
		}
		System.out.println("Students: ");
		for (int i = 0; i < school.studentsSize(); i++) {
			System.out.println("Id: "+school.getStudent(i).getId());
			System.out.println("Name: "+school.getStudent(i).getName());
			System.out.println("Class: "+school.getStudent(i).getClass());
		}
	}

}
