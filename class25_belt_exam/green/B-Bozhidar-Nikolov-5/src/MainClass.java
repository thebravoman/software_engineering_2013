import java.util.*;

public class MainClass {
	
	static Scanner input = new Scanner(System.in);
	
	public static void main(String[] args) {
	
		List<PieChart> pieList = new ArrayList<PieChart>();
		List<BarChart> barList = new ArrayList<BarChart>();
		String check = input.nextLine();
		
		while(!check.equals("a")) {
			check = input.nextLine();
			if(!check.equals("a")) {
				int value = Integer.parseInt(check);
				if(value % 2 == 0) {
					pieList.add(new PieChart(value));
				} else {
					barList.add(new BarChart(value));
				}
			}
		}
		
		int i = 0;
		
		while(i < pieList.size()) {
			System.out.println(pieList.get(i).getValue1() + ", " + pieList.get(i).getValue2());
			i++;
		}
		
		i = 0;
		while(i < barList.size()) {
			System.out.println(barList.get(i).getValue1() + ", " + barList.get(i).getValue2());
			i++;
		}
		
		i = 0;
		while(i < barList.size()) {
			System.out.println(barList.get(i).getValue2());
			i++;
		}
		
		i = 0;
		while(i < pieList.size()) {
			System.out.println(pieList.get(i).getValue1() + ", " + pieList.get(i).getValue2());
			i++;
		}
		
		i = 0;
		while(i < barList.size()) {
			System.out.println(barList.get(i).getValue1() + ", " + barList.get(i).getValue2());
			i++;
		}
		
	}

}
