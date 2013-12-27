package homework23;

public class Plane extends MessageScreen {

	private int[][] seats;
	private int emptySeats;

	public Plane(int rows, int seatsPerRow) {
		this.seats = new int[rows][seatsPerRow];
		this.emptySeats = rows * seatsPerRow;
	}

	public void fly() {
		while (emptySeats > 0) {
			Group newGroup = new Group();

			if (newGroup.members == 1)
				message = "*** " + newGroup.members
						+ " new passenger is looking for a seat. ***";
			else
				message = "*** " + newGroup.members
						+ " new passengers are looking for seats. ***";
			printMessage();
			addPassengers(newGroup);
			printSeats();
			printMessage();
		}

		message = "*** The plane is full. Please put on your seat belts! ***";
		printMessage();
	}

	private void addPassengers(Group group) {
		message = "*** Passengers successfully seated! ***";

		findSeats(group.members);
	}

	private void printSeats() {
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

		System.console().readLine();
	}

	private void findSeats(int passengers) {
		for (int row = 0; row < seats.length; row++) {
			for (int rowSeat = 0; rowSeat < seats[row].length; rowSeat++) {
				if (passengers == 1 && roomForOne(row, rowSeat)) {
					seats[row][rowSeat] = 1;
					emptySeats--;
					return;
				} else if (passengers == 2 && roomForTwo(row, rowSeat)) {
					seats[row][rowSeat] = 2;
					seats[row][rowSeat + 1] = 2;
					emptySeats -= 2;
					return;
				} else if (passengers == 3 && roomForThree(row, rowSeat)) {
					seats[row][rowSeat] = 3;
					seats[row][rowSeat + 1] = 3;
					seats[row][rowSeat + 2] = 3;
					emptySeats -= 3;
					return;
				}
			}
		}

		message = "*** The passengers didn't find seats and will wait for the next flight. ***";
	}

	private Boolean roomForOne(int row, int seat) {
		return seats[row][seat] == 0;
	}

	private Boolean roomForTwo(int row, int seat) {
		return roomForOne(row, seat) && seat < seats[row].length - 1
				&& seat != seats[row].length / 2 - 1
				&& seats[row][seat + 1] == 0;
	}

	private Boolean roomForThree(int row, int seat) {
		return roomForTwo(row, seat)
				&& seat < seats[row].length - 2
				&& (seat < seats[row].length / 2 - 2 || seat >= seats[row].length / 2)
				&& seats[row][seat + 2] == 0;
	}

}
