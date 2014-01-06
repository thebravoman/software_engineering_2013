package org.elsys.se.class23.homework;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.elsys.se.class23.homework.people.*;
import org.elsys.se.class23.homework.plane.*;
public class Main {

	public static void main(String[] args) {
		int boardedPassengers = 0;
		int planeRows = 27;
		int planeCols  = 6;
		
		Plane pesho = new Plane(planeRows,planeCols);
		RandomInRange random = new RandomInRange(1,3);
		Group group = new Group();
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		pesho.printSeatsPlan();
		
		while(boardedPassengers < planeRows*planeCols) {
			try {
				br.readLine();
			} catch (IOException e) {
			}
			int newMembersCount = random.generate();
			for(int i=0;i<newMembersCount;++i) {
				group.addMember(new Passenger());
			}
			if(pesho.addGroup(group)) {
				pesho.printSeatsPlan();
				boardedPassengers+=newMembersCount;
			}
			group.clear();
		}
		
		pesho.fly();
	}
}
