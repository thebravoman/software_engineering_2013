package org.elsys;

import java.util.ArrayList;

public class Class {
	private static int id;
	private int grade;
	private String letter;
	private String specialization;
	
	public Class(int grade, String letter, String specialization) {
		++id;
		this.grade = grade;
		this.letter = letter;
		this.specialization = specialization;
	}
	
	public static int getLastId() {
		return id;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getLetter() {
		return letter;
	}
	public void setLetter(String letter) {
		this.letter = letter;
	}
	public String getSpecialization() {
		return specialization;
	}
	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}
	
}
