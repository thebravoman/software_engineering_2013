
public class Teacher extends Person{
	
	public Teacher(int age, String first, String last) {
		super(age, first, last);
	}

	public String specialization;

	public String getSpecialization() {
		return specialization;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}
	
}
