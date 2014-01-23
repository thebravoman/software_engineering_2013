package elsys.green.src;

import java.util.ArrayList;
import java.util.Scanner;

public class MainClass {

	public static void main(String[] args) {
		ArrayList<Chart> list = new ArrayList<Chart>();
		Scanner terminal = new Scanner(System.in);
		
		String[] text;
		
		int counter = 0;
		
		while(true) {
			text = (terminal.next()).split(",");
			
			if(text.length == 1) { 
				break;
			}
			
			if(counter % 2 == 0) {
				PieChart p = new PieChart(Integer.parseInt(text[0]), 
											Integer.parseInt(text[1]));
				list.add(p);
			}else {
				BarChart b = new BarChart(Integer.parseInt(text[0]),
											Integer.parseInt(text[1]));
				list.add(b);
			}
			
			++counter;
		}

		for(Chart c: list) {
 			if(c instanceof PieChart && c.value2 > 0) {
				((PieChart)c).bogomil();
			}
 			System.out.println(c.value1);
			System.out.println(c.value2);
		}
		
		for(Chart c: list) {
			System.out.println(c.value1 + c.value2);
		}
	}

}
