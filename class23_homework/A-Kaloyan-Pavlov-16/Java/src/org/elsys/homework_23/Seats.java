package org.elsys.homework_23;

public class Seats {
	
	
	public Boolean FillSeats(int[][] seats, int peopleCount)
	{
		if(peopleCount == 1)
		{
			for(int i = 0; i < 27; i++)
			{
				for(int k = 0; k < 6; k ++)
				{
					if(seats[i][k] == 0)
					{
						seats[i][k] = 1;					
						System.out.println(
								"Seat filled: " + i + " " + k);
						return true;
					}
				}
			}
		}
		else if(peopleCount == 2)
		{
			for(int i = 0; i < 27; i++)
			{
				for(int k = 0; k < 5; k++)
				{
					if(seats[i][k] == 0 && seats[i][k+1] == 0)
					{
						seats[i][k] = 1;
						seats[i][k+1] = 1;
						System.out.println(
								"Seat filled: " + i + " " + k +  ", Seat: " + i+ " "+(k+1) + " ");
						return true;
					}
				}
			}
		}
		else
		{
			for(int i = 0; i < 27; i++)
			{
				for(int k = 0; k < 4; k++)
				{
					if(seats[i][k] == 0 && seats[i][k+1] == 0 && seats[i][k+2] == 0)
					{
						seats[i][k] = 1;
						seats[i][k+1] = 1;
						seats[i][k+2] = 1;
						System.out.print(
								"Seat filled: " + i + " " + k +  ", Seat: " + i+ " "+ (k+1) + " ");
						System.out.println(
								", Seat: " + i + " " +(k+2));
						return true;
					}
				}
			}	
		}
		System.out.println(
				"No space. ");
		
		if(peopleCount == 1)
		{
			System.out.print("Plane full");
			return false;
		}
		
		System.out.println(
				"Will try another group");
		return true;
	}
}
