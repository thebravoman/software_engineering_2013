package planeHomework;

public class Passenger
{

	private int seats[][];

	public Passenger(int seats[][])
	{
		this.seats = seats;
	}

	public void addOnePassenger()
	{
		boolean isPassangerAdded = false;
		for (int i = 0; i < 27; i++)
		{
			for (int k = 0; k < 6; k++)
			{
				if (seats[i][k] == 0)
				{
					seats[i][k] = 1;
					isPassangerAdded = true;
					break;
				}
			}
			if (isPassangerAdded)
			{
				break;
			}
		}
	}

	public void addTwoPassengers()
	{
		boolean isPassangerAdded = false;
		for (int i = 0; i < 27; i++)
		{
			for (int k = 0; k < 5; k++)
			{
				if (seats[i][k] == 0 && seats[i][k + 1] == 0 && k != 2)
				{
					seats[i][k] = 2;
					seats[i][k + 1] = 2;
					isPassangerAdded = true;
					break;
				}
			}
			if (isPassangerAdded)
			{
				break;
			}
		}
	}

	public void addThreePassengers()
	{
		boolean isPassangerAdded = false;
		for (int i = 0; i < 27; i++)
		{
			for (int k = 0; k < 6; k++)
			{
				if ((k == 0) || (k == 3))
				{
					if ((seats[i][k] == 0) && (seats[i][k + 1] == 0) && (seats[i][k + 2] == 0))
					{
						seats[i][k] = 3;
						seats[i][k + 1] = 3;
						seats[i][k + 2] = 3;
						isPassangerAdded = true;
						break;
					}
				}
			}
			if (isPassangerAdded)
			{
				break;
			}
		}
	}

	public void groupCheck(int seats[][], int passengers)
	{
		if (passengers == 1)
		{
			addOnePassenger();
		}

		if (passengers == 2)
		{
			addTwoPassengers();
		}

		if (passengers == 3)
		{
			addThreePassengers();
		}
	}
}
