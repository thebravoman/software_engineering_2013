package planeHomework;

public class Group
{
	private int[][] seats;

	public Group(int[][] seats)
	{
		this.seats = seats;
	}

	public int randomGenerator()
	{
		return (int) (Math.random() * 3) + 1;
	}

	public void groupCheck(int seats[][], int passengers)
	{
		Passenger passenger = new Passenger(seats);

		if (passengers == 1)
		{
			passenger.addOnePassenger();
		}
		else if (passengers == 2)
		{
			passenger.addTwoPassengers();
		}

		else if (passengers == 3)
		{
			passenger.addThreePassengers();
		}
	}

	public boolean checkFreeSeats()
	{
		boolean isFreeSeat = false;

		for (int i = 0; i < seats.length; i++)
		{
			//
			for (int j = 0; j < seats[0].length; j++)
			{
				if (seats[i][j] == 0)
				{
					isFreeSeat = true;
					break;
				}
			}
			if (isFreeSeat)
			{
				break;
			}
		}

		return isFreeSeat;
	}

	public void printGrid()
	{
		for (int i = 0; i < 27; i++)
		{
			for (int j = 0; j < 6; j++)
			{
				if (j == 3)
				{
					System.out.print("   ");
				}
				System.out.printf("%2d", seats[i][j]);
			}
			System.out.println();
		}
	}
}
