package org.elsys.greenbelt;
import java.util.ArrayList;
import java.util.Scanner;

public class MainClass {
	public static void main(String[] args) {

		int value1 = 0;
		int value2 = 0;

		int c=0;
		String output;
		
		ArrayList<Integer> l = new ArrayList<>();
		
		ArrayList<Integer> lSum = new ArrayList<>();
		
		
		Scanner scan = new Scanner(System.in);
		
		while(true){
			c++;
			output=(scan.next());
			String v=output;
			
			
			if(output.equals("a")) {
				break;
			} else if(c%2==0){
				PieChart pch = new PieChart(value1, value2);
				int cp_v=Integer.parseInt(v);
				
				value1=cp_v*2;
				value2 = cp_v*4;

				l.add(value1);
				l.add(value2);
				
				int summ=(value1+value2);
				lSum.add(summ);
				
				
				
			}else if (c%2!=0){
				BarChart bch = new BarChart(value1,value2);

				int cp_v=Integer.parseInt(v);
				
				value2=bch.denis(value1,value2);
				
				value1=cp_v*3;
				value2=cp_v*5;
				
				l.add(value1);
				l.add(value2);
				
				int summ2=(value1+value2);
				lSum.add(summ2);
				
			}
			
			
		}
		

		for (int s : l) {  
	        System.out.println(s);  
	      }  
//	    System.out.println();
	    
	    for (int s : lSum) {  
	        System.out.println(s);  
	      }  
		
//		Всяко четно въвеждане създава и съхранява в колекция инстанция на
//		PieChart, където value1=value*2 и value2 = value*4,
		
}	}
