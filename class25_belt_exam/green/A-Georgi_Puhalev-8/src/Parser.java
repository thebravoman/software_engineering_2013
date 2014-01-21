import java.io.IOException;


public class Parser {
	public void parser() throws IOException{
		int i = 0;
		String delims = "[, ]+";
		
		String line = String.valueOf(System.in.read());
		String[] tokens = line.split(delims);
		if(tokens.length == 3){
			i++;
			
			if (i%2==0){
				PieChart chart = new PieChart();
			}else{
				BarChart chart = new BarChart();
			}
		}else if(tokens.length==1){
			System.out.println("wip");
		}else{
			System.out.println("Invalid arguments!");
		}
	}
}
