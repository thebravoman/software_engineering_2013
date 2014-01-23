import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		String inputedText = "xaxa";
		List<ClassForAll> instances = new ArrayList<ClassForAll>();
		int counter = 1;
		while(inputedText.length() != 1){
			inputedText = input.nextLine();
			String[] inputedArray = inputedText.split(",");
			int[] inputedIntArray = new int[2];
			if(inputedText.length() >= 2){
				for (int i = 0; i < inputedArray.length; i++) {
					inputedIntArray[i] = Integer.parseInt(inputedArray[i]);
				}
				if(counter % 2 == 0){
					instances.add(new PieChart(inputedIntArray[0],inputedIntArray[1]));	
				}else{
					instances.add(new BarChart(inputedIntArray[0],inputedIntArray[1]));
				}
			}
			counter++;
		}
		for (int i = 0; i < instances.size(); i++) {
			System.out.println(instances.get(i).getValue1()+" "+instances.get(i).getValue2());
			if (instances.get(i) instanceof PieChart){
				((PieChart)instances.get(i)).hristiqn();
			}
		}
		System.out.println("\n");
		for (int i = 0; i < instances.size(); i++) {
			System.out.println(instances.get(i).getValue1()+" "+instances.get(i).getValue2());
		}
		input.close();
	}
}
