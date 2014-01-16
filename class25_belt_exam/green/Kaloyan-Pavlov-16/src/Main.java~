
import java.util.ArrayList;
import java.util.Scanner;


public class Main {
        public static void main(String[] args)
        {
                ArrayList<PieAndBar> list = new ArrayList<PieAndBar>();
                Scanner sc = new Scanner(System.in);
                String[] output;
                int counter = 1;
                
                while(true)
                {
                        output = (sc.next()).split(",");
                        
                        if(output.length == 1)
                                break;
                        
                        if((counter%2) == 0)
                        {
                                int one = Integer.parseInt(output[0]);
                                int two = Integer.parseInt(output[1]);
                                int three = Integer.parseInt(output[2]);
                                PieChart pie = new PieChart(one,two,three);
                                list.add(pie);
                        }else
                        {
                                int one = Integer.parseInt(output[0]);
                                int two = Integer.parseInt(output[1]);
                                int three = Integer.parseInt(output[2]);
                                BarChart bar = new BarChart(one,two,three);
                                list.add(bar);
                        }
                        
                        
                        
                        counter++;
                }
                
                for(PieAndBar barpie: list)
                {
                        System.out.println(barpie.getVal1());
                        System.out.println(barpie.getVal2());
                        System.out.println(barpie.getVal3());
                }
                
                for(PieAndBar barpie: list)
                {
                        if(barpie instanceof PieChart)
                        {

                                ((PieChart) barpie).kaloyan();
 
                        }
                }
                
                for(PieAndBar barpie: list)
				{
                        int sum = 0;
                        sum = barpie.getVal1() + barpie.getVal2() + barpie.getVal3();
                        System.out.println(sum);
                }
                
        }
}
