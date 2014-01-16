import java.util.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
public class main {
	private static List<Chart> charts = new LinkedList<Chart>();
	public static void main(String[] args) {
		
		boolean odd = true;
		boolean go = true;
		int v1 =0,v2 = 0,v3 = 0;
		String s = "";
		while(go) {
			BufferedReader bufferRead = new BufferedReader(new InputStreamReader(System.in));
		    try {
				s = bufferRead.readLine();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    
		    String[] parts = s.split(",");
		    if(parts.length == 1) {
		    	break;
		    }
		    parts[0] = parts[0].replace(" for value1", "");
		    parts[1] = parts[1].replace(" for value2", "");
		    parts[2] = parts[2].replace(" for value3", "");
		    v1 = Integer.parseInt(parts[0].trim());
		    v2 = Integer.parseInt(parts[1].trim());
		    v3 = Integer.parseInt(parts[2].trim());
		    
			if(odd) {
				charts.add(new BarChart(v1,v2,v3));
			}
			else {
				charts.add(new PieChart(v1,v2,v3));
			}
			
			odd = !odd;
		}
		
		printChartValues();
		for(Chart chart:charts) {
			if(chart instanceof PieChart) {
				((PieChart) chart).ivaylo();
			}
		}
		printChartValues();
		


	}
	
	private static void printChartValues() {
		for(Chart chart:charts) {
			System.out.println("value1 = " + chart.getValue1() + " value2 = " + chart.getValue2() + " value3 = " + chart.getValue3());
			
		}
	}

}
