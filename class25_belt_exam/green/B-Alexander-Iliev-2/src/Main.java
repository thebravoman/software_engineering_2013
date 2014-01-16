import java.util.ArrayList;
import java.util.Scanner;




public class Main {
	public static void main(String[] args) {
		ArrayList<Chart> list = new ArrayList<Chart>();
        Scanner console = new Scanner(System.in);
        String[] output;
        int count = 0;
		while(true){
			output = (console.next()).split(",");
			if(output.length == 1)
                break;
			count++;
			if (count%2 != 0){
				int one = Integer.parseInt(output[0]);
                int two = Integer.parseInt(output[1]);
                int three = Integer.parseInt(output[2]);
                PieChart p = new PieChart(one,two,three);
                list.add(p);
			}else{
                int one = Integer.parseInt(output[0]);
                int two = Integer.parseInt(output[1]);
                int three = Integer.parseInt(output[2]);
                BarChart b = new BarChart(one,two,three);
                list.add(b);
			}
			count++;
		}
	}
}
