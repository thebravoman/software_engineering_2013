package elsys.class24;

public abstract class Person {
	protected String name = "";

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	abstract public void sayGreeting();
}
