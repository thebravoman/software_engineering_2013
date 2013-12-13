
public class Teacher {
	
	private String name;
	private String subject;
	private String gender;
	
	public Teacher(String n, String s, String g) {
		this.name = n;
		this.subject = s;
		this.gender = g;
	}
	
	public String toString() {
		return this.name + ", " + this.subject + ", " + this.gender;
	}

	public String getName() {
		return this.name;
	}
	
	
	public String getSubject() {
		return this.subject;
	}
	
	
	public String getGender() {
		return this.gender;
	}
}
