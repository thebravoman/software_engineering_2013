package org.elsys.dww;
import java.util.Scanner;
import java.util.List;
import java.util.ArrayList;

public class Main
{
	public static boolean isNumeric(String str)  
	{  
	  try  
	  {  
	    double d = Double.parseDouble(str);  
	  }  
	  catch(NumberFormatException nfe)  
	  {  
	    return false;  
	  }  
	  return true;  
	}
	
	public static void main(String[] args)
	{
		Scanner scanner = new Scanner(System.in);
		String inputline;
		String nom[];
		ArrayList<Chart> storage = new ArrayList<Chart>();
		int a;
		int b;
		
		for(a=0;;)
		{
			inputline=scanner.nextLine();
			nom=inputline.split(" ");
			if(nom.length==10)
			{
				if(nom[9].equals("p"))
				{
					storage.add(new PieChart(Integer.parseInt(nom[0]),Integer.parseInt(nom[3]),Integer.parseInt(nom[6])));
					a++;
				}
				if(nom[9].equals("b"))
				{
					storage.add(new BarChart(Integer.parseInt(nom[0]),Integer.parseInt(nom[3]),Integer.parseInt(nom[6])));
					a++;
				}
			}
			if(nom.length==1)
			{
				if(isNumeric(nom[0]))
					break;
			}
		}
		System.out.println("Debug Here");
		
		for(b=0;b<a;b++)
		{
			
			if(storage.get(b) instanceof PieChart)
			{
				((PieChart)storage.get(b)).nedko();
			}
			System.out.print(storage.get(b).getValue1());
			System.out.print(" ");
			System.out.print(storage.get(b).getValue2());
			System.out.print(" ");
			System.out.println(storage.get(b).getValue3());
		}
	}
}
