package org.elsys.homework_23;

import java.util.Scanner;


public class Main 
{
	public static void main(String[] args)
	{		
		int[][] places = new int[27][6] ;
		People people = new People();
		Seats seats = new Seats();
		int currentVal = 0;
		Scanner sc = new Scanner(System.in);
		do
		{			
			System.out.println("Press enter to find the passenger places");
			sc.nextLine();
			currentVal = people.GeneratePeople();			
		}while(seats.FillSeats(places, currentVal));
		sc.close();
	}	
}
