package elsys;

public class Student extends Person {
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getBelongs_to_class() {
		return belongs_to_class;
	}
	public void setBelongs_to_class(String belongs_to_class) {
		this.belongs_to_class = belongs_to_class;
	}
	public String getSpecialty() {
		return specialty;
	}
	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}
	public int number;
	public String belongs_to_class;
	public String specialty;
	
}
