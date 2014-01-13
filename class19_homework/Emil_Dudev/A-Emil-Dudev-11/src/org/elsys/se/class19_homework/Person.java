package org.elsys.se.class19_homework;

import java.util.ArrayList;

public class Person {
	private String name;
	private int age;
	private String address;
	private ArrayList<String> telephones;
	private ArrayList<String> emails;
	
	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
		this.address = null;
		this.telephones = new ArrayList<String>();
		this.emails = new ArrayList<String>();
	}
	
	public String getName() {
		return name;
	}
	public int getAge() {
		return age;
	}
	public void incrementAge(int age) {
		++this.age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public ArrayList<String> getTelephones() {
		return telephones;
	}
	public void addTelephone(String telephone) {
		this.telephones.add(telephone);
	}
	public ArrayList<String> getEmails() {
		return emails;
	}
	public void addEmail(String email) {
		this.emails.add(email);
	}
}
