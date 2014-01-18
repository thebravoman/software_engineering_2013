package org.elsys.se.beltexam;

import java.util.*;
import java.lang.*;

public class Main {
	public static int[] parse(String input) {
		int ret[] = new int[3];
		String[] split = input.split(",");

		if(split.length != 3) {
			return null;
		}

		for(int i = 0; i < 3; i++) {
			ret[i] = Integer.parseInt(split[i]);
		}

		return ret;
	}


	public static void main(String[] args) {		
		ArrayList<Chart> charts = new ArrayList<Chart>();
        Scanner sc = new Scanner(System.in);

		

		while(true) {
			int[] vals = parse(sc.next());
			if(vals == null)
				break;
			if(charts.size() % 2 == 0) 
				charts.add(new PieChart(vals[0], vals[1], vals[2]));
			else
				charts.add(new BarChart(vals[0], vals[1], vals[2]));
		}

		for(Chart ch : charts) {
			ch.print();
		}

		for(Chart ch: charts) {
			if(ch instanceof PieChart) {
				if(ch.getValue2() > 0) {
					((PressianAbarov2)ch).presian();
				}
			}
		}

		for(Chart ch: charts) {
			ch.print();
		}
	}
}
