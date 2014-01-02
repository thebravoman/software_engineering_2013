package Elsys.Homework;

import java.util.Scanner;


public class Plane {

	private int[][] seats;
	private int seatcount;
	private int[] freeseats;
	
	public Plane(){
		this.seats = new int[27][6];
		this.seatcount = 0;
		this.freeseats = new int[27];
		
		for(int i=0; i< 27 ; i++)
			freeseats[i] = 6;
	}
	
	private void findSeat(int count, int size){
		int free;
		if (freeseats[count]==6){
			free=0;
		} else {
			free=6-freeseats[count];
		}
		
		for (int i = free; i<free+size; i++){
			System.out.printf("<Pasenger seated ROW:%d SEAT:%d>\n", count+1, i+1);
			seats[count][i] = 1;
		}
	}
	
	private void addGroup(){
		Group gr = new Group();
		int grsize = gr.getSize();
		for (int i=this.seatcount; i<27; i++){
			if (freeseats[i] >= grsize){
				findSeat(i,grsize);
				freeseats[i] -=grsize;
				break;
			} else{
				if (i==26)
					System.out.println("<There are no free seats for this group>");
			}
		}
		if (freeseats[seatcount] == 0) seatcount+=1;
	}
	
	private void printSeats(){
		for (int i=0;i<27;i++){
			for(int j=0;j<6;j++){
				if(seats[i][j] == 1){
					System.out.printf("<ROW:%d|SEAT:%d - OCUPIED>\n",i+1,j+1);
				} else {
					System.out.printf("<ROW:%d|SEAT:%d - FREE>\n",i+1,j+1);
				}
			}
		}
	}
	
	public void getPlaneReady() {
		Scanner scan = new Scanner(System.in);
		while(this.seatcount<27){
			System.out.println();
			System.out.println("press ENTER...");
			String readString =scan.nextLine();
			if (readString.equals("")){
				addGroup();
				printSeats();	
			}
		}
		scan.close();
	}
	
}
