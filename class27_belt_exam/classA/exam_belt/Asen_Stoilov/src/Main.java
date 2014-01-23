import java.util.ArrayList;
import java.util.Scanner;


public class Main {

	public static void main(String[] args) {
		ArrayList<Chart> list = new ArrayList<Chart>();
		Scanner sc = new Scanner(System.in);
		String str;
		boolean turn = false;
		while(true){
			str = sc.next();
			
			if (str.equals("a"))
				break;
			
			if (turn){
				int val = Integer.parseInt(str);
				PieChart p = new PieChart(val*2,val*4); 
				list.add(p);
			}else{
				int val = Integer.parseInt(str);
				BarChart p = new BarChart(val*3,val*5); 
				list.add(p);
			}
			turn = true;
		}
		
		for (Chart c: list){
			System.out.println(c.getValue1());
			System.out.println(c.getValue2());
		}
		
		for (Chart c: list){
			if (c instanceof BarChart){
				((BarChart)c).asen();
			}
		}
		for (Chart c: list){
			System.out.println(c.getValue1()+c.getValue2());
		}
	}

}
