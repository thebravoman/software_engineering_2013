package green;

import java.util.*;
import green.PieChart;

public class Main {
	public static void main( String[] args ) {
		String input = System.console().readLine();
		String[] parsed = input.split(",");
		LinkedList<Chart> col = new LinkedList<Chart>();
		int i = 1;
		while( parsed.length != 1 ) {
			if( i % 2 == 0 ) {
				col.push( new PieChart( Integer.parseInt(parsed[0]), Integer.parseInt(parsed[1]), Integer.parseInt(parsed[2]) ) );
			} else {
				col.push( new BarChart( Integer.parseInt(parsed[0]), Integer.parseInt(parsed[1]), Integer.parseInt(parsed[2]) ) );
			}			
			++i;
		}

		for( Chart ch : col ) {
			ch.print();		
		}
		for( Chart ch : col ) {
			if( ch instanceof PieChart && ((PieChart)ch).decrement() ) {
				((PieChart)ch).emil();
			}
		}
		for( Chart ch : col ) {
			ch.print();		
		}
	}
}
