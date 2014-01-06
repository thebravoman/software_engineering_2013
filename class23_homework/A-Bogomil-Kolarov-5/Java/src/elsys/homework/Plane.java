package elsys.homework;

public class Plane {
	private int seats[][];
	private int currentSeat;

	Plane(int rows, int seatsPerRow) {
		seats = new int[rows][seatsPerRow];
	}
	
	public void prepare() {
		System.out.println("Monkeys prepare...");
		findSeats();
	}

	public void print() {
		System.out.println("Monkeys prepared.");
		for(int row = 0; row < seats.length; ++row) {
			for(int i = 0; i < seats[row].length; ++i) {
				System.out.print(seats[row][i]);
				if(i == 2) System.out.print(" | ");
				if(i == seats[row].length - 1) System.out.print("\n");
			}
		}
	}
	
	private void findSeats() {
		GroupGenerator group = new GroupGenerator();
		int peopleInGroup;
		int seatsLeft;
		int colomn = 1;

		for(int row = 0; row < seats.length; ++row) {
			currentSeat = 0;
			seatsLeft = seats[row].length / 2;
			colomn = 1;
			
			while(colomn < 3) {
				if(currentSeat == 6) 
					break;
				
				peopleInGroup = group.randomGroup(seatsLeft);
				System.out.println(peopleInGroup + " monkeys are coming. Press any key to find seats for them...");
				System.console().readLine();
				seatsLeft = fillSeats(peopleInGroup, row);
				if(seatsLeft == 0) {
					seatsLeft = 3;
					++colomn;
				}
			}
		}
	}
	
	private int fillSeats(int people, int row) {
		int fullSeats = currentSeat;

		for(int seat = 0; seat < people; ++seat) {
			if(currentSeat == 6) {
				return 0;
			}
			seats[row][currentSeat] = people;
			++fullSeats;
			++currentSeat;
		}

		if(currentSeat > 2) fullSeats -= 3;
		return (seats[row].length / 2) - fullSeats;
	}
}
