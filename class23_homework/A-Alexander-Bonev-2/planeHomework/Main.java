package planeHomework;

import java.util.Scanner;

public class Main
{
	
	public int seats[][] = new int[27][6];

	public static void main(String[] args)
	{
		Main run = new Main();
		run.run();
	}

	private void run()
	{
		Group group = new Group(seats);
		Scanner readLine = new Scanner(System.in);

		while (group.checkFreeSeats())
		{
			group.printGrid();
			System.out.println();
			readLine.nextLine();
			int randomNumber = group.randomGenerator();
			group.groupCheck(seats, randomNumber);
		}
		group.printGrid();
		System.out.println("FLY!");
		readLine.close();
		
		
	}
}
