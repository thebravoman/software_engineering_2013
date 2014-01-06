package org.elsys.se.class23.homework.plane;

import org.elsys.se.class23.homework.people.*;

public class Plane {
	private Passenger[][] leftSeats;
	private Passenger[][] rightSeats;
	private int seatRows;
	private int seatColumns;
	
	public Plane(int rows, int cols) {
		seatRows = rows;
		seatColumns = cols; 
		leftSeats = new Passenger[seatRows][seatColumns/2];
		rightSeats = new Passenger[seatRows][seatColumns/2];
	}
	
	public boolean addGroup(Group group) {
		boolean seatedLeft = true;
		int[] firstSeat = new int[2]; //row,column
		firstSeat = findEmptySeats(leftSeats,group.getSize());
		if(firstSeat[0] == -1 && firstSeat[1] == -1 ) {
			seatedLeft = false;
			firstSeat = findEmptySeats(rightSeats,group.getSize());
			if(firstSeat[0] == -1 && firstSeat[1] == -1 ) {
				return false;
			}
		}
		if(seatedLeft == true) {
			seatGroup(group,firstSeat,leftSeats);
		}
		else {
			seatGroup(group,firstSeat,rightSeats);
		}
		return true;
	}
	
	private void seatGroup(Group group, int[] seatNum, Passenger[][] seats) {
		for(int person=0;person<group.getSize();++person) {
			seats[seatNum[0]][seatNum[1]] = group.getMember(person);
			++seatNum[1];

		}
	}
	
	private int[] findEmptySeats(Passenger[][] seats, int amount) {
		int[] seatNumber = {-1,-1}; //row,column
		int free = 0, seat = 0;
		for(int row=0;row<seatRows;++row) {
			free = 0;
			seat = 0;
			for(int col=0;col<seatColumns/2;++col) {
				if(seats[row][col] == null) {
					if(free==0)seat = col;
					++free;
					if(free == amount) {
						seatNumber[0] = row;
						seatNumber[1] = seat;
						free = 0;
						seat = 0;
						return seatNumber;
					}
				}
				else {
					if(free!=0) {
						free = 0;
						seat = 0;
						break;
					}
				}
			}
		}
		return seatNumber;
	}
	
	public void fly() {
		System.out.println("PIKIRAM");
	}
	
	public void printSeatsPlan() {
		System.out.println("Left seats:");
		printSeats(leftSeats);
		System.out.println("Right seats:");
		printSeats(rightSeats);
		System.out.println();
	}
	
	private void printSeats(Passenger[][] seats) {
		for(int row=0;row<seatRows;++row) {
			for(int col=0;col<seatColumns/2;++col) {
				if(seats[row][col] == null) {
					System.out.print("[ ]");
				}
				else {
					System.out.print("[O]");
				}
			}
			System.out.println();
		}
	}

	
	
}
