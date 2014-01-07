package org.elsys.class19_homework;

import java.util.ArrayList;

public class Person 
{
		private String name;
	    private int age;
	    private String address;
	    private ArrayList<String> telephones;
	    private ArrayList<String> emails;
	    private ArrayList<String> qualifications;
        
	    public Person(String name, int age) 
	    {
            super();
            this.name = name;
            this.age = age;
            this.address = null;
            this.telephones = new ArrayList<String>();
            this.emails = new ArrayList<String>();
            
	    }
	    
		public String getName() 
		{
			return name;
		}		
		
		public int getAge() 
		{
			return age;
		}
		
		public String getAddress() 
		{
			return address;
		}
		
		public void setAddress(String address)
		{
			this.address = address;
		}
		
		public ArrayList<String> getTelephones() 
		{
			return telephones;
		}
		
		public void setTelephones(String telephones)
		{
			this.telephones.add(telephones);
		}
		
		public ArrayList<String> getEmails() 
		{
            return emails;
		}
		
		public void addEmail(String email) 
		{
            this.emails.add(email);
		}

		public ArrayList<String> getQualifications() {
			return qualifications;
		}

		public void addQualifications(String qualifications) {
			this.qualifications.add(qualifications);
		}
        
        
}
