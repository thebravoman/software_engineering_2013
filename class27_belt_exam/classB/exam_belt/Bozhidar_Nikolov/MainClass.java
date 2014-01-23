import java.util.*;

public class MainClass {

	public static void main(String[] args) {
	
		Scanner input = new Scanner(System.in);
		List<Chart> list = new ArrayList<Chart>();
		String[] check;
		int numOfInputs = 0;
		
		while(true) {
			check = (input.nextLine()).split(",");
			numOfInputs++;
			if(check.length == 1) {
				break;
			} else {
				if(numOfInputs % 2 == 0) {
					list.add(new PieChart(Integer.parseInt(check[0]), Integer.parseInt(check[1]), Integer.parseInt(check[2])));
				} else {
					list.add(new BarChart(Integer.parseInt(check[0]), Integer.parseInt(check[1]), Integer.parseInt(check[2])));
				}
			}
		}
		
		for(Chart c : list) {
			System.out.println(c);
			if(c instanceof PieChart) {
				if(c.getValue2() > 0) {
					((PieChart) c).bozhidar();
				}
			}
		}
		
		for(Chart c : list) {
			System.out.println(c);
		}
	
	}
}
