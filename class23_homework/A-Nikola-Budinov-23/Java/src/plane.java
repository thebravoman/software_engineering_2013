import java.io.IOException;
import java.util.Random;



public class plane
{
	int[][] fly = new int[27][6];
	int gr;
	int row;
	
	void display()
	{
		int c = 0;
		for(int row=0; row<27; row++)
		{
			c = 0;
			for(int seat=0;seat<6;seat+=1 )
			{
				if (c <3 )
				{
				System.out.print("" + fly[row][seat]);
				c+=1;
				}
				else
				{
					System.out.printf("    " + fly[row][seat]);  
					c = 1;
				}
			}
			System.out.println();
		}
	}
	
	void looker (int gr)
	{
		this.gr = gr;
		int row,seat,s=0;
		boolean isPutted = false;
		
		
		for(row=0; row<27; row++)
		{
			for(seat=0;seat<6; seat++ )
			{
				if (this.gr == 1 )
				{
					for(s = 0; s < 6; s++)
					{
						if (fly[row][s] == 0)
						{
							fly[row][s] = 1;
							isPutted = true;
							break;
						}
					}
				}				
				
				if (this.gr == 2)
				{
					if (fly[row][s] == 0 && fly[row][s + 1] == 0)
					{
						fly[row][s] = 2;
						fly[row][s+1] = 2;
						isPutted = true;
						break;
					}
					else if (fly[row][s+1] == 0 && fly[row][s+2] == 0 )
					{
						fly[row][s+1] = 2;
						fly[row][s+2] = 2;
						isPutted = true;
						break;
					}
					else if (fly[row][s+3] == 0 && fly[row][s+4] == 0 )
					{
						fly[row][s+3] = 2 ;
						fly[row][s+4] = 2; 		
						isPutted = true;
						break;
					}
					else if (fly[row][s+4] == 0 && fly[row][s+5] == 0 )
					{
						fly[row][s+4] = 2 ;
						fly[row][s+5] = 2; 	
						isPutted = true;
						break;
					}				
				}
		
				if (this.gr == 3)
				{
					if (fly[row][s] == 0 && fly[row][s + 1] == 0 && fly[row][s + 2] == 0)
					{
						fly[row][s] = 3;
						fly[row][s+1] = 3;
						fly[row][s+2] = 3;
						isPutted = true;
						break;
					}
					if (fly[row][s+3] == 0 && fly[row][s + 4] == 0 && fly[row][s + 5] == 0)
					{
						fly[row][s+3] = 3;
						fly[row][s+4] = 3;
						fly[row][s+5] = 3;
						isPutted = true;
						break;
					}			
				}
				if (isPutted == true)
					break;
				
			}
			if (isPutted == true)
				break;
			
			if(row == 26 && seat > gr )
			{
		
				System.out.println("Not free place for the group..Sorry ;( ");
			}
			
		}
	}
	
	//public void check(int seat)
	//{
	//	if (seat > this.gr && seat != 5)
	//	{
	//		System.out.println("Call a new group..");
	//		looker(gr);
	//	}
	//}
	
	
	public int getRandom()
	{
		Random rand = new Random();
		return  rand.nextInt(3)+1;
	}
	
	public void keyPress() throws IOException
	{
		System.out.println(" Press Enter.. You! :V");
		System.in.read();
	}
}
