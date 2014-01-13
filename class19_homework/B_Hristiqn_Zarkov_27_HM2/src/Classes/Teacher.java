package Classes;

public class Teacher {
	private String name;
	private String subject;
	private int age;
	private int sex;
	
	public Teacher(String name) {
		setName(name);
	}
	public String getName() {
		return name;
	}
	private void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getSex() {
		String sex;
		if(this.sex == 1){
			sex = "Mele";
		}else{
			sex = "Female";
		}
		return sex;
	}
	public void setSex(String sex) {
		if(sex == "Mele"){
			this.sex = 1;
		}else{
			this.sex = 0;
		}
	}
}
