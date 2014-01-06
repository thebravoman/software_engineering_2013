package org.elsys.plane;

import java.util.Arrays;

public class Plane {
	static int[][] seats = new int[27][6];
	static void DisplaySeats(){
		System.out.println(Arrays.deepToString(seats).replaceAll("],", "],\r\n"));
	}
}
