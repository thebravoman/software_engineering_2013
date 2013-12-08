package org.elsys.School;

public class Subject {
	String name;
	String description;
	int importance;
	protected String getName() {
		return name;
	}
	protected void setName(String name) {
		this.name = name;
	}
	protected String getDescription() {
		return description;
	}
	protected void setDescription(String description) {
		this.description = description;
	}
	protected int getImportance() {
		return importance;
	}
	protected void setImportance(int importance) {
		this.importance = importance;
	}
	
}
