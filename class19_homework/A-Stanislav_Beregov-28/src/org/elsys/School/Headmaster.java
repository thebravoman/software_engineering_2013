package org.elsys.School;

public class Headmaster extends Teacher{
	Headmaster() {
		priviledged = true;
	}
	int budget;
	protected int getBudget() {
		return budget;
	}
	protected void setBudget(int budget) {
		this.budget = budget;
	}
	
}
