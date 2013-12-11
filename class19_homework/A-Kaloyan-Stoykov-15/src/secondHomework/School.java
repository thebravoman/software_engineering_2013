package secondHomework;

public class School {
	private String schoolName;
	private String schoolAddress;
	private int schoolPhoneNumber;
	private Teacher[] teachers;
	private Student[] students;
	
	public Teacher[] getTeachers() {
		return teachers;
	}
	public void setTeachers(Teacher[] teachers) {
		this.teachers = teachers;
	}
	public Student[] getStudents() {
		return students;
	}
	public void setStudents(Student[] students) {
		this.students = students;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getSchoolAddress() {
		return schoolAddress;
	}
	public void setSchoolAddress(String schoolAddress) {
		this.schoolAddress = schoolAddress;
	}
	public int getSchoolPhoneNumber() {
		return schoolPhoneNumber;
	}
	public void setSchoolPhoneNumber(int schoolPhoneNumber) {
		this.schoolPhoneNumber = schoolPhoneNumber;
	}

}
