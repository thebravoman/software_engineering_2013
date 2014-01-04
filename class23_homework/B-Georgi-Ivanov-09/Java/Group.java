package Homework23;

// It does work... It's just GitHub is showing the old message...
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
