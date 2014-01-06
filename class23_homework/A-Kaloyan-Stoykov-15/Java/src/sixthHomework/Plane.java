package sixthHomework;

public class Plane {
	private int[][] seats;
	private int seatsTaken;
	
	public Plane(int row, int col) {
		this.seats = new int[row][col];
		this.seatsTaken = 0;
	}
	
	public int getSeatsTaken() {
		return seatsTaken;
	}

	public void setSeatsTaken(int seatsTaken) {
		this.seatsTaken = seatsTaken;
	}
	
	public  void add(Group group) {
		for(int row = 0; row < seats.length; row++) {
			for(int col = 0; col < seats[0].length; col++) {
				if((group.getSize() == 1) && (seats[row][col] == 0)) {
					seats[row][col] = 1;
					
					int taken = this.getSeatsTaken();
					this.setSeatsTaken(taken + 1);
					
					return;
				} 
				else if ((group.getSize() == 2) && (col != 2 && col != 5) && (seats[row][col] == 0 && seats[row][col + 1] == 0)) {
					seats[row][col] = 2;
					seats[row][col + 1] = 2;
					
					int taken = this.getSeatsTaken();
					this.setSeatsTaken(taken + 2);
					
					return;
				}
				else if ((group.getSize() == 3) && (col == 0 || col == 3)
						 && (seats[row][col] == 0 && seats[row][col + 1] == 0 && seats[row][col + 2] == 0)) {
					seats[row][col] = 3;
					seats[row][col + 1] = 3;
					seats[row][col + 2] = 3;
					
					int taken = this.getSeatsTaken();
					this.setSeatsTaken(taken + 3);
					
					return;
				}
				
			}

		}
	}
	
	public void printSeats() {
		for(int i = 0; i < seats.length; i++) {
			for(int j = 0; j < seats[0].length; j++) {
				System.out.print(seats[i][j]);
				if(j == 2) {
					System.out.print(" ");
				}
				
			}
			System.out.println();
		}
	}
}
