package hw3;

public class Plane {
	
	private boolean seatsOcupped[][];
	private int currentRow;
	private int currentColumn;
	
	public Plane(){
		seatsOcupped = new boolean[27][6];
		for(int i = 0; i<seatsOcupped.length; i++){
			for(int j = 0; j<seatsOcupped[i].length; j++){
				seatsOcupped[i][j] = false;
			}
		}
		currentRow = 0;
		currentColumn = 0;
	}
	
	public void addPeople(int people){
		while(people>0 && !isFull()){
			seatsOcupped[currentRow][currentColumn] = true;
			people--;
			currentColumn++;
			if(currentColumn>5){
				currentColumn = 0;
				currentRow++;
			}
		}
	}
	public boolean isFull(){
		return seatsOcupped[26][5];
	}
	public void printSeats(){
		for(int i = 0; i<seatsOcupped.length; i++){
			for(int j = 0; j<seatsOcupped[i].length; j++){
				if(j == 3){
					System.out.print(" ");
				}
				System.out.print(seatsOcupped[i][j] ? "X" : "O");
			}
			System.out.println();
		}
	}
}
