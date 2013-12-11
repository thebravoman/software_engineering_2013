
public class School {
	String name;
	String phoneNumber;
	String email;
	Adress adress;
	Person headmaster;
	Subject[] subjects;
	SchoolClass[] classes;
	Student[] students;
	Teacher[] teachers;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Adress getAdress() {
		return adress;
	}
	public void setAdress(Adress adress) {
		this.adress = adress;
	}
	public Person getHeadmaster() {
		return headmaster;
	}
	public void setHeadmaster(Person headmaster) {
		this.headmaster = headmaster;
	}
	public Subject[] getSubjects() {
		return subjects;
	}
	public void setSubjects(Subject[] subjects) {
		this.subjects = subjects;
	}
	public SchoolClass[] getClasses() {
		return classes;
	}
	public void setClasses(SchoolClass[] classes) {
		this.classes = classes;
	}
	public Student[] getStudents() {
		return students;
	}
	public void setStudents(Student[] students) {
		this.students = students;
	}
	public Teacher[] getTeachers() {
		return teachers;
	}
	public void setTeachers(Teacher[] teachers) {
		this.teachers = teachers;
	}
}
