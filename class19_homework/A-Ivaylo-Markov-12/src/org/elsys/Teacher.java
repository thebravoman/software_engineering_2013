package org.elsys;
import org.elsys.util.ContactInfo;

public class Teacher {
	private static int id;
	private String name;
	
	private ContactInfo contactInfo;

	public Teacher(String name, ContactInfo contactInfo) {
		++id;
		this.name = name;
		this.contactInfo = contactInfo;
	}

	public static int getLastId() {
		return id;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ContactInfo getContactInfo() {
		return contactInfo;
	}

	public void setContactInfo(ContactInfo contactInfo) {
		this.contactInfo = contactInfo;
	}
}
