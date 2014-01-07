package org.elsys.plane;

import java.util.Scanner;

public class MainClass
{
	public static void main(String[] args) {
		int sum=0;
		int rnd;
		while(sum<162){
			new Scanner(System.in).nextLine();
			rnd=RandGen.GenerateNum();
			System.out.println("\n"+ "Seats:" +  rnd +"\n");
	        sum+=rnd;
	        SeatsAranger.Arange(rnd);
	        Plane.DisplaySeats();
		}
  }
}


