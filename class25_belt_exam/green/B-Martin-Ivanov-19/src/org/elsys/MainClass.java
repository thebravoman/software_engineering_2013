package org.elsys;

import java.util.ArrayList;
import java.util.Scanner;


public class MainClass {
	public static void main(String[] args) {
		ArrayList<Chart> list = new ArrayList<Chart>();
		Scanner terminal = new Scanner(System.in);
		String[] output;
		int counter = 1;
		
		while(true){
			output = (terminal.next()).split(",");
			
			if(output.length == 1)
				break;
			
			if((counter%2) == 0){
				int one = Integer.parseInt(output[0]);
				int two = Integer.parseInt(output[1]);
				int three = Integer.parseInt(output[2]);
				PieChart p = new PieChart(one,two,three);
				list.add(p);
			}else{
				int one = Integer.parseInt(output[0]);
				int two = Integer.parseInt(output[1]);
				int three = Integer.parseInt(output[2]);
				BarChart b = new BarChart(one,two,three);
				list.add(b);
			}
			
			
			
			counter++;
		}
		
		for(Chart c: list){
			System.out.println(c.getValue1());
			System.out.println(c.getValue2());
			System.out.println(c.getValue3());
		}
		
		for(Chart c: list){
			if(c instanceof PieChart){
				if(c.getValue2() > 0){
					((PieChart) c).martin();
				}
			}
		}
		
		for(Chart c: list){
			int sum = 0;
			sum = c.getValue1() + c.getValue2() + c.getValue3();
			System.out.println(sum);
		}
		
	}
}
