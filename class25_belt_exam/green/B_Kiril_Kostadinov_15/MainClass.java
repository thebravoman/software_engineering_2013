import java.util.LinkedList;
import java.util.Scanner;

public class MainClass {

	public static void main(String[] args) {
		LinkedList<Chart> list = new LinkedList<Chart>();
		String input;
		int end = 0;
		int numOfInput = 1;
		
		Scanner scanner = new Scanner(System.in);
		
		while(end != 1) {
			input = scanner.nextLine();
			String[] values = input.split(",");
			if(values.length == 1) {
				end = 1;
			} else {
				if(numOfInput % 2 == 0) {
					list.add(new PieChart(Integer.parseInt(values[0]), Integer.parseInt(values[1]), Integer.parseInt(values[2])));

				} else {
					list.add(new BarChart(Integer.parseInt(values[0]), Integer.parseInt(values[1]), Integer.parseInt(values[2])));
				}
			}
			numOfInput++;
		}
		scanner.close();
		
		for (Chart o: list) {
			System.out.println(o.getA() + ", " + o.getB() + ", " + o.getC());
		}
		
		for (Chart o: list) {
			if(o instanceof PieChart) {
				if(o.getB() > 0) {
					((PieChart) o).kiril();
				}
			}
		}
		
		int sum1 = 0;
		int sum2 = 0;
		int sum3 = 0;
		
		for (Chart o: list) {
			sum1 += o.getA();
			sum2 += o.getB();
			sum3 += o.getC();
		}
		
		System.out.println(sum1 + ", " + sum2 + ", " + sum3);
	}

}
