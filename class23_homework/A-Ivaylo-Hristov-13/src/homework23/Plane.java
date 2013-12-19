package homework23;

public class Plane {
	int[][] seats;
	int passengers;
	String message;

	public Plane(int rows, int seatsPerRow) {
		this.seats = new int[rows][seatsPerRow];
		this.passengers = rows * seatsPerRow;
	}

	public void addPassengers(Group group) {
		message = "***** Passengers successfully seated! *****";

		if (group.members == 1) {
			for (int row = 0; row < seats.length; row++) {
				for (int rowSeat = 0; rowSeat < seats[row].length; rowSeat++) {
					if (seats[row][rowSeat] == 0) {
						seats[row][rowSeat] = 1;
						passengers--;
						return;
					}
				}
			}
		} else if (group.members == 2) {
			for (int row = 0; row < seats.length; row++) {
				for (int rowSeat = 0; rowSeat < seats[row].length; rowSeat++) {
					if (seats[row][rowSeat] == 0
							&& rowSeat < seats[row].length - 1
							&& rowSeat != seats[row].length / 2 - 1
							&& seats[row][rowSeat + 1] == 0) {
						seats[row][rowSeat] = 2;
						seats[row][rowSeat + 1] = 2;
						passengers -= 2;
						return;
					}
				}
			}
		} else if (group.members == 3) {
			for (int row = 0; row < seats.length; row++) {
				for (int rowSeat = 0; rowSeat < seats[row].length; rowSeat++) {
					if (seats[row][rowSeat] == 0
							&& rowSeat < seats[row].length - 2
							&& (rowSeat < seats[row].length / 2 - 2 || rowSeat >= seats[row].length / 2)
							&& seats[row][rowSeat + 1] == 0
							&& seats[row][rowSeat + 2] == 0) {
						seats[row][rowSeat] = 3;
						seats[row][rowSeat + 1] = 3;
						seats[row][rowSeat + 2] = 3;
						passengers -= 3;
						return;
					}
				}
			}
		}

		message = "*** The passengers didn't find seats and will wait for the next flight. ***";
	}

	public void printSeats() {
		System.out.println("   Odd Rows			   Even Rows");
		
		for (int row = 0; row < seats.length; row += 2) {
			for (int rowSeat = 0; rowSeat < seats[row].length; rowSeat++) {
				System.out.print(seats[row][rowSeat] + " ");
				if (rowSeat == seats[row].length / 2 - 1) {
					System.out.print("	");
				}
			}
			System.out.print("			");
			if (row != seats.length - 1) {
				for (int rowSeat = 0; rowSeat < seats[row + 1].length; rowSeat++) {
					System.out.print(seats[row + 1][rowSeat] + " ");
					if (rowSeat == seats[row + 1].length / 2 - 1) {
						System.out.print("	");
					}
				}
			}
			System.out.println();
		}
	}

	public int getPassengers() {
		return passengers;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
