import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		List<Chart> charts = new ArrayList<Chart>();

		Scanner scanIn = new Scanner(System.in);
		int index = 1;
		while (true) {
			String line = scanIn.nextLine();
			String[] split = line.split(",");
			if (null != split && 3 == split.length) {
				try {
					int value1 = Integer.parseInt(split[0]);
					int value2 = Integer.parseInt(split[1]);
					int value3 = Integer.parseInt(split[2]);
					
					if (0 == (index % 2)) {
						charts.add(new PieChart(value1, value2, value3)); 
					} else {
						charts.add(new BarChart(value1, value2, value3)); 
					}
				} catch (NumberFormatException e) {
					break;
				}
			} else {
				break;
			}
		}
		
		for (Chart chart : charts) {
			System.out.println(chart);
		}
		
		for (Chart chart : charts) {
			if (chart instanceof PieChart) {
				PieChart current = (PieChart) chart;
				if (0 < current.getValue2()) {
					current.ivaylo();
				}
			}
		}
		
		for (Chart chart : charts) {
			System.out.println(chart);
		}

		scanIn.close();
	}
}
