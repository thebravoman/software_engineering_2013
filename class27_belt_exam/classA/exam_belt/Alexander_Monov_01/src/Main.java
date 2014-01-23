import java.util.ArrayList;
import java.util.Scanner;


public class Main {
        public static void main(String[] args)
        {
                ArrayList<PieBar> list = new ArrayList<PieBar>();
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
                                PieChart pie = new PieChart(one,two);
                                list.add(pie);
                        }else
                        {
                                int one = Integer.parseInt(output[0]);
                                int two = Integer.parseInt(output[1]);
                                BarChart bar = new BarChart(one,two);
                                list.add(bar);
                        }
                        
                        
                        
                        counter++;
                }
                
                for(PieBar barpie: list)
                {
                        System.out.println(barpie.getVal1());
                        System.out.println(barpie.getVal2());
                }
                
                for(PieBar barpie: list)
                {
                        if(barpie instanceof PieChart)
                        {

                                ((PieChart) barpie).alexander();
 
                        }
                }
                
                for(PieBar barpie: list)
                                {
                        int sum = 0;
                        sum = barpie.getVal1() + barpie.getVal2();
                        System.out.println(sum);
                }
                
        }
}