package Homework23;

public class Group {
	private int peopleInGroup;	
	
	public Group(){
		setPeopleInGroup(randomGenerator());
	}
	
	public int randomGenerator(){ 
	   return (int)(Math.random() * 3) + 1;
	}

	// GETTERS AND SETTERS
	public int getPeopleInGroup() {
		return peopleInGroup;
	}

	public void setPeopleInGroup(int peopleInGroup) {
		this.peopleInGroup = peopleInGroup;
	}
}
