import java.util.Scanner;

public class PassengerPlane {
	
	private int capacity[][] = new int [27][6];
	private int sum = 162;
	Scanner input = new Scanner(System.in);
	
	public void fillPlane() {
		GroupOfPassengers currentGroup = new GroupOfPassengers();
		while(this.sum > 0) {
			System.out.println("Press enter to add another group to the plane...");
			input.nextLine();
			currentGroup.setSize();
			arrangeSeats(currentGroup.getSize());
			System.out.println("Added group of " + currentGroup.getSize() + " people...");
		}
	}
	
	public void arrangeSeats(int group) {
		switch(group) {
		case 1:
			addOnePerson();
		case 2:
			addTwoPeople();
		case 3:
			addThreePeople();
		}
	}
	
	public void addOnePerson() {
		if(sum - 1 >= 0) {
			for(int i = 0; i < 27; i++) {
				for(int j = 0; j < 6; j++) {
					if(capacity[i][j] == 0) {
						capacity[i][j] = 1;
						this.sum -= 1;
						return;
					}
				}
			}
		} else {
			System.out.println("Plane is already full...");
		}
	}
	
	public void addTwoPeople() {
		if(sum - 2 > 0) {
			for(int i = 0; i < 27; i++) {
				for(int j = 0; j < 6; j++) {
					switch(j) {
					case 0:
						if(capacity[i][j] == 0 && capacity[i][j + 1] == 0) {
							capacity[i][j] = 2;
							capacity[i][j + 1] = 2;
							this.sum -= 2;
							return;
						}
					case 1:
						if(capacity[i][j] == 0 && capacity[i][j + 1] == 0) {
							capacity[i][j] = 2;
							capacity[i][j + 1] = 2;
							this.sum -= 2;
							return;
						}
					case 3:
						if(capacity[i][j] == 0 && capacity[i][j + 1] == 0) {
							capacity[i][j] = 2;
							capacity[i][j + 1] = 2;
							this.sum -= 2;
							return;
						}
					case 4:
						if(capacity[i][j] == 0 && capacity[i][j + 1] == 0) {
							capacity[i][j] = 2;
							capacity[i][j + 1] = 2;
							this.sum -= 2;
							return;
						}
					}
				}
			}
		} else {
			System.out.println("Not enough seats for 2 more passengers...");
		}
	}
	
	public void addThreePeople() {
		if(sum - 3 > 0) {
			for(int i = 0; i < 27; i++) {
				for(int j = 0; j < 6; j++) {
					switch(j) {
					case 0:
						if(capacity[i][j] == 0 && capacity[i][j + 1] == 0 && capacity[i][j + 2] == 0) {
							capacity[i][j] = 3;
							capacity[i][j + 1] = 3;
							capacity[i][j + 2] = 3;
							this.sum -= 3;
							return;
						}
					case 3:
						if(capacity[i][j] == 0 && capacity[i][j + 1] == 0 && capacity[i][j + 2] == 0) {
							capacity[i][j] = 3;
							capacity[i][j + 1] = 3;
							capacity[i][j + 2] = 3;
							this.sum -= 3;
							return;
						}
					}
				}
			}
		} else {
			System.out.println("Not enough seats for 3 more passengers...");
		}
	}
	
	public int getSum() {
		return this.sum;
	}
	
	public void displaySeats() {
		System.out.println("Press enter to display the seats...");
		input.nextLine();
		for(int i = 0; i < 27; i++) {
			for(int j = 0; j < 6; j++) {
				System.out.print(capacity[i][j]);
			}
			System.out.println();
		}
	}
}
