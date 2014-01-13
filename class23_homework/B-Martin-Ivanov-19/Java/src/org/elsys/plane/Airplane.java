package org.elsys.plane;

public class Airplane {
	private Human[][] seats = new Human[27][6];

	public void printSeats() {
		for (int i = 0; i < 27; i++) {
			System.out.print("row" + (i + 1) + "---");
			for (int k = 0; k < 6; k++) {
				if (k == 2) {
					System.out.print(seats[i][k].getGender());
					System.out.print("...");
				} else {
					System.out.print(seats[i][k].getGender());
				}
			}
			System.out.println();
		}
	}

	public boolean isFull() {
		boolean full = true;
		for (int i = 0; i < 27; i++) {
			for (int k = 0; k < 6; k++) {
				if (seats[i][k] == null)
					full = false;
				// if there is a free element full becomes false
			}
		}
		return full;
	}

	public void addOnePassenger() {
		for (int i = 0; i < 27; i++) {
			for (int k = 0; k < 6; k++) {
				if (seats[i][k] == null) {
					seats[i][k] = new Human("1");
					System.out.println("Im in 1");
					break;
				}
			}
		}
	}

	public void addTwoPassengers() {
		for (int i = 0; i < 27; i++) {
			for (int k = 0; k < 5; k++) {
				if ((seats[i][k] == null) && (seats[i][k + 1] == null)
						&& (k != 2)) {
					seats[i][k] = new Human("2");
					seats[i][k + 1] = new Human("2");
					System.out.println("Im in 2");
					break;
				}
			}
		}
	}

	public void addThreePassengers() {
		for (int i = 0; i < 27; i++) {
			for (int k = 0; k < 4; k++) {
				if ((k == 0) || (k == 3)) {
					if ((seats[i][k] == null) && (seats[i][k + 1] == null)
							&& (seats[i][k + 2] == null)) {
						seats[i][k] = new Human("3");
						seats[i][k + 1] = new Human("3");
						seats[i][k + 2] = new Human("3");
						System.out.println("Im in 3");
						break;
					}
				}
			}
		}
	}

}
