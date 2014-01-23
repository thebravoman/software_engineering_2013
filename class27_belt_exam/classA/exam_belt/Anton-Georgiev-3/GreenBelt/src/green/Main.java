package green;

import java.util.LinkedList;

public class Main {
	public static void main(String[] args) {
		String line;
		String[] parsed;
		LinkedList<Chart> list = new LinkedList<Chart>();
		
		line = System.console().readLine();
		parsed = line.split(",");
		while(parsed.length!=1) {
			if(parsed[3]=="b") {
				list.push(new BarChart(Integer.parseInt(parsed[0]), Integer.parseInt(parsed[1]), Integer.parseInt(parsed[2])));
			} else if(parsed[3]=="p") {
				list.push(new PieChart(Integer.parseInt(parsed[0]), Integer.parseInt(parsed[1]), Integer.parseInt(parsed[2])));
			}
			line = System.console().readLine();
			parsed = line.split(",");
		}
		
		for(Chart c : list) {
			if((c instanceof PieChart) && c.value2>c.value1) {
				((PieChart) c).anton();
			}
		}
		
		for(Chart c : list) {
			c.print();
		}
	}
}