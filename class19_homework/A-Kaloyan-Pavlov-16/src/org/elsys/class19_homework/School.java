package org.elsys.class19_homework;

import java.util.ArrayList;

public class School 
{
        private ArrayList<Student> students;
        private ArrayList<Teacher> teachers;
        
        public School() 
        {
            super();
            this.students = new ArrayList<Student>();
            this.teachers = new ArrayList<Teacher>();
        }
        public void addStudent(Student student, Class newClass )
        {
            this.students.add(student);  
        }
    
        public void addTeacher(Teacher teacher) 
        {
            this.teachers.add(teacher);
        }
}