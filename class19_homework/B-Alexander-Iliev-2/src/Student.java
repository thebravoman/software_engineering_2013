
public class Student extends Person{
	
	public Student(int age, String first, String last) {
		super(age, first, last);
	}

	public Class current_class;

	public Class getCurrent_class() {
		return current_class;
	}

	public void setCurrent_class(Class current_class) {
		this.current_class = current_class;
	}
}
