package hw3;

import java.util.Random;
import java.util.Scanner;

public class Test {

	/**
	 * @param args
	 */
	public static int getPeople(){
		Random r = new Random();
		return r.nextInt(3)+1;
	}
	
	public static void main(String[] args) {
		Plane plane = new Plane();
		int addedPeople = 0;
		int places = 27*6;
		Scanner sc = new Scanner(System.in);
		while(addedPeople<places){
			int people = getPeople();
			while(people+addedPeople > places){
				people = getPeople();
			}
			addedPeople +=people;
			String command = sc.nextLine();
			if(command.equals("")){
				plane.addPeople(people);
				plane.printSeats();
			}
		}
	}

}
