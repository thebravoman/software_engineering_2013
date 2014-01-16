import java.io.IOException;


public class Main {
	public static void main(String[] args) throws IOException {
		int i = 0;
		String delims = "[, ]+";
		while(true){
			String line = String.valueOf(System.in.read());
			String[] tokens = line.split(delims);
			if(args.length == 3){
				i++;
				
				if (i%2==0){
					PieChart chart = new PieChart();
				}else{
					BarChart chart = new BarChart();
				}
			}else if(args.length==1){
				break;
			}else{
				System.out.println("Invalid arguments!");
			}
		}
	}
}

