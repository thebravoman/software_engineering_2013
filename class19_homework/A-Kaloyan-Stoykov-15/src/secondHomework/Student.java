package secondHomework;

public class Student {
	private String firstName;
	private String lastName;
	private int grade;
	private int age;
	private int phoneNumber;
	private School school;
	private Class schoolClass;
	
	public Class getSchoolClass() {
		return schoolClass;
	}
	public void setSchoolClass(Class schoolClass) {
		this.schoolClass = schoolClass;
	}
	public School getSchool() {
		return school;
	}
	public void setSchool(School school) {
		this.school = school;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(int phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
}
