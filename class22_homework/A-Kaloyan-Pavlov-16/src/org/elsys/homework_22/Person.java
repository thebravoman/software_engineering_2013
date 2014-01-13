package org.elsys.homework_22;

public class Person 
{
	protected int age;
	protected String name;
	protected int heigth;
	
	public Person(int age, String name, int heigth)
	{
		this.age = age;
		this.name = name;
		this.heigth = heigth;
	}
	
	public int getAge()
	{
		return age;
	}

	public String getName() 
	{
		return name;
	}

	public int getHeigth() 
	{
		return heigth;
	}
	
}
