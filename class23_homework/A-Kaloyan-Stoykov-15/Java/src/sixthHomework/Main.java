package sixthHomework;

import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		int row = 27;
		int col = 6;
		Plane plane = new Plane(row,col);
		
		while(plane.getSeatsTaken() != row * col) {
			Group currentGroup = new Group();
			System.out.println(plane.getSeatsTaken());
			
			if(plane.getSeatsTaken() > row * col) {
				plane.setSeatsTaken(plane.getSeatsTaken() - currentGroup.getSize());
				System.out.println("We were enable to find seats for group of " + currentGroup.getSize() + " members. Wainting for the next group");
			} else {
				System.out.println("We are about to place " + currentGroup.getSize() + " persons. Proceed?");
				new Scanner(System.in).nextLine();
				plane.add(currentGroup);
				plane.printSeats();
			}
		}		
	}
}
