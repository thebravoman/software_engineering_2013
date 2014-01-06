package upgradingAirPlane;

import java.io.IOException;

public class Plane {
	int numberOfRows = 27;
	int numberOfSeats = 3;
	int [][] row1 = new int [numberOfRows][numberOfSeats];
	int [][] row2 = new int [numberOfRows][numberOfSeats];
	int emptySeats = numberOfRows*numberOfSeats*2;
	boolean check = true;
	
	public void airPlane() throws IOException {
		while(emptySeats > 0){
			int g = group();
			filler(g);
			System.out.println("Remaining empty seats: " + emptySeats);
			System.in.read();			
		}
		System.out.println("Here is the destribution of the passengers:");
		printer();
	}
	
	private void printer(){
		for(int i = 0; i < numberOfRows; i++){
			System.out.print("| ");
			for(int n = 0; n < numberOfSeats; n++){
				System.out.print(row1[i][n]);
			}
			System.out.print(" ");
			for(int n = 0; n < numberOfSeats; n++){
				System.out.print(row2[i][n]);
			}
			System.out.print(" |");
			System.out.println();
		}
	}
	
	private int group(){
		Randomizer randomizer = new Randomizer();
		int members = randomizer.randomNumber();
		return members;
	}

	private void filler(int count){
		switch(count){
		case 1:
			System.out.println("1 new passenger wants to come aboard!");
			check = true;
			checker1(row1);
			if(check == true)
				checker1(row2);
			if(check == true)
				System.out.println("Sorry, we have no room for you");
			else
				System.out.println("Passenger successfully seated!");
			break;
		case 2:
			System.out.println("2 new passengers want to come aboard!");
			check = true;
			checker2(row1);
			if(check == true)
				checker2(row2);
			if(check == true)
				System.out.println("Sorry, we have no room for you");
			else
				System.out.println("Passengers successfully seated!");
			break;
		case 3:
			System.out.println("3 new passengers want to come aboard!");
			check = true;
			checker3(row1);
			if(check == true)
				checker3(row2);
			if(check == true)
				System.out.println("Sorry, we have no room for you");
			else
				System.out.println("Passengers successfully seated!");
			break;
		}
		
	}
	
	private void checker1(int [][] row){
		for(int co = 0; co < numberOfRows; co++){
			for(int n = 0; n < numberOfSeats; n++){
				if(row[co][n] == 0){
					row[co][n] = 1;
					check = false;
					break;
				}
			}
			if (check == false)
					break;
		}	
		if (check == false)
			emptySeats -= 1;
	}
	
	private void checker2(int[][] row){
		for(int co = 0; co < numberOfRows; co++){
			for(int n = 0; n < numberOfSeats-1; n++){
				if(row[co][n] == 0 && row[co][n+1] == 0){
					row[co][n] = 2;
					row[co][n+1] = 2;
					check = false;
					break;
				}
			}
			
			if (check == false)
				break;
		}	
		if(check == false)
			emptySeats -= 2;
	}
	
	private void checker3(int[][] row){
		for(int co = 0; co < numberOfRows; co++){
			for(int n = 0; n < numberOfSeats-2; n++){
				if(row[co][n] == 0 && row[co][n+1] == 0 && row[co][n+2] == 0){
					row[co][n] = 3;
					row[co][n+1] = 3;
					row[co][n+2] = 3;
					check = false;
					break;
				}
			}
			if (check == false)
				break;
		}
		if(check == false)
			emptySeats -= 3;
	}
}