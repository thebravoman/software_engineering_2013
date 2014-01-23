
import java.util.ArrayList;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {

		ArrayList<Chart> collection=new ArrayList<Chart>();
		Scanner input=new Scanner(System.in);
		String[] in;
		//int counter=1;
		
		while(true){
			in=(input.next()).split(",");
			if (in.length==1)
				break;
			String type=in[3];
			int value1 = Integer.parseInt(in[0]);
			int value2 = Integer.parseInt(in[1]);
			int value3 = Integer.parseInt(in[2]);
			if (type.equals("p")){
				PieChart pie=new PieChart(value1, value2, value3);
				collection.add(pie);	
			}
			else
				if(type.equals("b")){
					BarChart bar=new BarChart(value1, value2, value3);
					collection.add(bar);
				}
		}
		for(Chart c: collection){
			if (c instanceof PieChart){
				if(c.getValue2()>c.getValue1()){
					((PieChart) c).nikola();
				}
			}
		}
		for (Chart c: collection){
			System.out.print(c.getValue1());
			System.out.print(c.getValue2());
			System.out.print(c.getValue3());
			System.out.println();
		}
	}
}