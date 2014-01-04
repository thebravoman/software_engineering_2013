package Homework23;

public class Plane {
	private int [][] seats;
	private int emptySeasts;
	private int numOfRows;
	private int numOfSeatsPerRow;
	private int afterWhichSeatIsTheWalkway;
	
	Plane(int rows, int seatsPerRow, int afterWhichSeatIsTheWalkway){
		seats = new int[rows+1][seatsPerRow+1]; // Just so we start from the first seat of the first row rather than the 0 seat of the 0 row...
		setNumOfRows(rows);
		setNumOfSeatsPerRow(seatsPerRow);
		setEmptySeasts(rows*seatsPerRow);
		setAfterWhichSeatIsTheWalkway(afterWhichSeatIsTheWalkway);
		emptyPlane();
	}		
	
	public void flyPlane(){
		System.out.println("Flying away...");
	}
	
	public void fillPlane(){
		while(getEmptySeasts() > 0){
			addGroupToPlane();
		}
		System.out.println("Plane is full!");
	}
	
	public void addGroupToPlane(){
		Group newGroup = new Group();
		System.out.println("Created group of " + newGroup.getPeopleInGroup());
		findSeats(newGroup);
	}
	
	public void findSeats(Group newGroup){
		if(newGroup.getPeopleInGroup() == 1){
			addOnePerson(newGroup);
		}else if(newGroup.getPeopleInGroup() == 2 && getEmptySeasts() >= 2){
			addTwoPeople(newGroup);
		}else if(newGroup.getPeopleInGroup() == 3 && getEmptySeasts() >= 3){
			addThreePeople(newGroup);
		}else{
			System.out.println("Not enough seats!");
		}
	}
	
	public void addOnePerson(Group newGroup){
		for(int rowCounter = 1; rowCounter <= getNumOfRows(); rowCounter++){
			for(int seatsCounter = 1; seatsCounter <= getNumOfSeatsPerRow(); seatsCounter++){
				if(seats[rowCounter][seatsCounter] == 0){ // Seat is empty
					seats[rowCounter][seatsCounter] = 1; // 1 because the passenger is alone :\
					emptySeasts--;
					System.out.println("Passenger 1 seat is row: " + rowCounter + ", seat: " + seatsCounter);
					return; // Exiting method
				}
			}
		}
	}
	
	public void addTwoPeople(Group newGroup){
		for(int rowCounter = 1; rowCounter <= getNumOfRows(); rowCounter++){
			for(int seatsCounter = 1; seatsCounter <= getNumOfSeatsPerRow()-1; seatsCounter++){
				if(seats[rowCounter][seatsCounter] == 0 && seats[rowCounter][seatsCounter+1] == 0){ // If this seat and the next one are free
					if(!(seatsCounter == getAfterWhichSeatIsTheWalkway() && seatsCounter+1 == getAfterWhichSeatIsTheWalkway()+1)){ // If the seats are separated by the walkway
						seats[rowCounter][seatsCounter] = 2;
						seats[rowCounter][seatsCounter+1] = 2;
						emptySeasts -= 2;
						System.out.println("Passenger 2 seat is row: " + rowCounter + ", seat: " + seatsCounter);
						System.out.println("Passenger 2's friend's seat is row: " + rowCounter + ", seat: " + (seatsCounter+1));
						return; // Exiting method
					}
				}
			}
		}
	}
	
	// Trying to understand this method can cause dizziness... Proceed at your own risk!
	public void addThreePeople(Group newGroup){
		for(int rowCounter = 1; rowCounter <= getNumOfRows(); rowCounter++){
			for(int seatsCounter = 1; seatsCounter <= getNumOfSeatsPerRow()-2; seatsCounter++){
				if(seats[rowCounter][seatsCounter] == 0 && seats[rowCounter][seatsCounter+1] == 0 && seats[rowCounter][seatsCounter+2] == 0){
					if(!(seatsCounter == getAfterWhichSeatIsTheWalkway() && seatsCounter+1 == getAfterWhichSeatIsTheWalkway()+1 && seatsCounter+2 == getAfterWhichSeatIsTheWalkway()+2)){ // checks if:  3 | 3 3
					if(!(seatsCounter+1 == getAfterWhichSeatIsTheWalkway() && seatsCounter+2 == getAfterWhichSeatIsTheWalkway()+1)){ // checks if:  3 3 | 3
						seats[rowCounter][seatsCounter] = 3;
						seats[rowCounter][seatsCounter+1] = 3;
						seats[rowCounter][seatsCounter+2] = 3;
						emptySeasts -= 3;
						System.out.println("Passenger 3 seat is row: " + rowCounter + ", seat: " + seatsCounter);
						System.out.println("Passenger 3's friend's seat is row: " + rowCounter + ", seat: " + (seatsCounter+1));
						System.out.println("Passenger 3's other friend's seat is row: " + rowCounter + ", seat: " + (seatsCounter+2));
						return; // Exiting method
						}
					}
				}
			}
		}
	}
	
	void emptyPlane(){
		for(int rowCounter = 1; rowCounter <= getNumOfRows(); rowCounter++){
			for(int seatsCounter = 1; seatsCounter <= getNumOfSeatsPerRow(); seatsCounter++){
				seats[rowCounter][seatsCounter] = 0; // Filling array with 0. 0 means a seat is empty
			}
		}
	}

	public void printAllSeats(){
	   for(int rowCounter = 1; rowCounter <= getNumOfRows(); rowCounter++){
	      for(int seatsCounter = 1; seatsCounter <= getNumOfSeatsPerRow(); seatsCounter++){
	         System.out.printf("%5d ", seats[rowCounter][seatsCounter]);  
	      }
	      System.out.println();
	   }
	}
	
	// GETTERS AND SETTERS
	public int getEmptySeasts() {
		return emptySeasts;
	}

	public void setEmptySeasts(int emptySeasts) {
		this.emptySeasts = emptySeasts;
	}

	public int getNumOfSeatsPerRow() {
		return numOfSeatsPerRow;
	}

	public void setNumOfSeatsPerRow(int numOfSeatsPerRow) {
		this.numOfSeatsPerRow = numOfSeatsPerRow;
	}

	public int getNumOfRows() {
		return numOfRows;
	}

	public void setNumOfRows(int numOfRows) {
		this.numOfRows = numOfRows;
	}

	public int getAfterWhichSeatIsTheWalkway() {
		return afterWhichSeatIsTheWalkway;
	}

	public void setAfterWhichSeatIsTheWalkway(int afterWhichSeatIsTheWalkway) {
		this.afterWhichSeatIsTheWalkway = afterWhichSeatIsTheWalkway;
	}		
}
