package org.elsys.homework_22;

import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;

public class Main 
{
	public static void main(String[] args)
	{
		LinkedList<Person> people = new LinkedList<>();
        
        Person person1 = new Person(30,"Gorg",180);
        Person person2 = new Person(25,"Pencho",175);
        Person person3 = new Person(45,"Goran",177);
        Person person4 = new Person(18,"Petko",173);
        
        people.add(person1);
        people.add(person2);
        people.add(person3);
        people.add(person4);
        
        Collections.sort
        (people, new Comparator<Person>() 
        		{            
		            @Override
		            public int compare(Person o1, Person o2) 
		            {
		                    return Double.compare( o1.getAge(), o2.getAge() );
		    
		            }                
        		}
        );
    
	    for (Person person : people) {
	    	System.out.println(person.getAge() + " " + person.getName() + " " + person.getHeigth()); 
	    }
	}
}
