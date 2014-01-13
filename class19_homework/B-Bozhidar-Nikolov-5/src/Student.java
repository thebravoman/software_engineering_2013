
public class Student{
	private String name;
	private int grade;
	private String gender;
	private int numberInClass;
	
	public String toString() {
		return this.name + ", " + this.grade + ", " + this.gender;
	}
	
	public void setName(String n) {
		name = n;
	}
	
	public String getName() {
		return this.name;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getNumberInClass() {
		return numberInClass;
	}

	public void setNumberInClass(int numberInClass) {
		this.numberInClass = numberInClass;
	}
}
