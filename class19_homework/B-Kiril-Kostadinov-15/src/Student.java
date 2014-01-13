
public class Student extends Person{
	SchoolClass cl;
	int numberInClass;
	Subject[] subjects;
	int[] grades;
	public SchoolClass getCl() {
		return cl;
	}
	public void setCl(SchoolClass cl) {
		this.cl = cl;
	}
	public int getNumberInClass() {
		return numberInClass;
	}
	public void setNumberInClass(int numberInClass) {
		this.numberInClass = numberInClass;
	}
	public Subject[] getSubjects() {
		return subjects;
	}
	public void setSubjects(Subject[] subjects) {
		this.subjects = subjects;
	}
	public int[] getGrades() {
		return grades;
	}
	public void setGrades(int[] grades) {
		this.grades = grades;
	}
}
