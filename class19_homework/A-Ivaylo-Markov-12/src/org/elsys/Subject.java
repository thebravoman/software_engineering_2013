package org.elsys;

import java.util.ArrayList;

public class Subject {
	private static int id;
	private String name;
	private String description;
	private boolean special;
	
	public Subject(String name, String description, boolean special) {
		++id;
		this.name = name;
		this.description = description;
		this.special = special;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isSpecial() {
		return special;
	}

	public void setSpecial(boolean special) {
		this.special = special;
	}
	
	

}
