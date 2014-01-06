public class Plane {
	
	int[][] seats = new int[27][6];
	public int free_seats = 162;
	
	public void printSeats(){
		for (int i = 0;i < 27; i++){
			System.out.println();
			System.out.print("row-" + (i+1) + " sits: ");
			for (int j = 0;j < 6; j++){
				System.out.print(" " + seats[i][j]);
			}
		}
	}
	
	public void fill_seats(int row,int column,int humans){
		for (int i = 1;i <= humans; i++){
			this.seats[row][column - humans + i] = humans;
		}
	}
	
	public void addHumans(){
		int check_free_seats = 0;
		boolean brk = false;
		int group_of = ((int)(Math.random() * 3 + 1));
		
		for (int i = 0;i < 27; i++){
			check_free_seats = 0;
			brk = false;
//			System.out.println("proverqva red " + i);
			for (int j = 0;j < 6; j++){
				if (this.seats[i][j] == 0){
					if (j == 3){
						check_free_seats = 1;
//						System.out.println("posredata e putekata");
					}else{
						check_free_seats += 1;
//						System.out.println("namira prazno mqsto na poziciq " + j);
					}
					
				}
				if (check_free_seats == group_of){
					fill_seats(i,j,group_of);
					this.free_seats -= group_of;
					// ne mi pulni masiva do kraq vseki put i ne moga da razbera zashto
					System.out.println("nastanqva putnici = " + group_of);
					brk = true;
					break;
				}
			}
			if (brk){
				break;
			}
		}
		System.out.println("svobodni mesta " + this.free_seats);
	}
}
