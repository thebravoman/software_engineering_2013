
public class Class {

	public String getNameOfClass() {
		return nameOfClass;
	}
	public void setNameOfClass(String nameOfClass) {
		this.nameOfClass = nameOfClass;
	}
	public Students[] getStudentsInClass() {
		return studentsInClass;
	}
	public void setStudentsInClass(Students[] studentsInClass) {
		this.studentsInClass = studentsInClass;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	private String nameOfClass;
	private Students[]  studentsInClass = new Students[28];
	private String teacherName;
	
	
	
	
}
