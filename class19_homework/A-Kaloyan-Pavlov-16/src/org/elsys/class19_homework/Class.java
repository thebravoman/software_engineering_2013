package org.elsys.class19_homework;

import java.util.ArrayList;

public class Class {
	private ArrayList<Student> students;
    private int grade;
    private char division;
    private int averageGradeInClass;

    public Class(int grade, char division) 
    {
            super();
            this.grade = grade;
            this.division = division;
            this.students = new ArrayList<Student>();
    }
    
    public ArrayList<Student> getStudents() 
    {
		return students;
	}

    public void addStudent(Student student) 
    {
        students.add(student);
    }

	public int getGrade() 
	{
		return grade;
	}

	public char getDivision() 
	{
		return division;
	}

	public int getAverageGradeInClass() {
		return averageGradeInClass;
	}

	public int calcAverageGradeInClass() {
		for(int i = 0; i < students.size(); i++ )
		{
			Student student = students.get(i) ;			
			this.averageGradeInClass += student.getAverageGrade();
		}
		return this.averageGradeInClass/students.size();
	}
	
	
}
