import java.util.*;

public class School {
	private String name;
	private String address;
	private ArrayList<Class> classes = new ArrayList<Class>();
	
	public School(String n, String a) {
		this.name = n;
		this.address = a;
	}
	
	public String toString() {
		return this.name + ", " + this.address;
	}
	
	public void setClass(Class c) {
		classes.add(c);
	}
	
	public Class getClass(int c) {
		return this.classes.get(c);
	}
}
