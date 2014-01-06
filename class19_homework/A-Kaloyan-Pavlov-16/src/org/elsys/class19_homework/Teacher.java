package org.elsys.class19_homework;

import java.util.ArrayList;

public class Teacher extends Person
{
	private ArrayList<String> subjects;
    private Class klass;
    
	public Teacher(String name, int age) 
	{
		super(name, age);
		setSubjects(new ArrayList<String>());
        setKlass(null);
	}

	public ArrayList<String> getSubjects() {
		return subjects;
	}

	public void setSubjects(ArrayList<String> subjects) {
		this.subjects = subjects;
	}

	public Class getKlass() {
		return klass;
	}

	public void setKlass(Class klass) {
		this.klass = klass;
	}

	
	
}
