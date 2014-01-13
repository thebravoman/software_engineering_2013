package homework;

public class Plane {
	private int[][] seats = new int[54][3];

	public int[][] getSeats() {
		return seats;
	}

	public void setSeats(int[][] seats) {
		this.seats = seats;
	}
	
	private void write(int seats[][],int i) {
		for(int j=0;j<3;j++) {
			System.out.print(seats[i][j]);
		}
	}
	
	public void writeSeats() {
		for(int i=0;i<54;i+=2) {
			write(seats,i);
			System.out.print(" ");
			write(seats,i+1);
			System.out.println();
		}
	}
	
	public boolean fillSeats(int passengers) {
		for(int i=0;i<54;i++) {
			if(passengers==3) {
				if(seats[i][0]==0 && seats[i][1]==0 && seats[i][2]==0) {
					seats[i][0]=1;
					seats[i][1]=1;
					seats[i][2]=1;
					return true;
				}
			}
			
			if(passengers==2) {
				if(seats[i][0]==0 && seats[i][1]==0) {
					seats[i][0]=1;
					seats[i][1]=1;
					return true;
				} else if(seats[i][1]==0 && seats[i][2]==0) {
					seats[i][1]=1;
					seats[i][2]=1;
					return true;
				}
			}
			
			if(passengers==1) {
				if(seats[i][0]==0) {
					seats[i][0]=1;
					return true;
				} else if(seats[i][1]==0) {
					seats[i][1]=1;
					return true;
				} else if(seats[i][2]==0) {
					seats[i][2]=1;
					return true;
				}
			}
			return false;
		}
	}
}
