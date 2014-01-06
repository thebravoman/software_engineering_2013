package org.elsys.class19_homework;

public class Student extends Person{
	private Class klass;
	private int numberInClass;
	private static int averageGrade;
	
	public Student(String name, int age, Class klass)
	{
		super(name, age);
        this.setKlass(klass);
	}

	public int getAverageGrade() {
		return averageGrade;
	}

	public void setAverageGrade(int theAverageGrade) {
		averageGrade = theAverageGrade;
	}	
	
	public void changeAverageGrade(int change)
	{
		averageGrade += change;
	}

	public Class getKlass() {
		return klass;
	}

	public void setKlass(Class klass) {
		this.klass = klass;
	}

	public int getNumberInClass() {
		return numberInClass;
	}

	public void setNumberInClass(int numberInClass) {
		this.numberInClass = numberInClass;
	}

}
