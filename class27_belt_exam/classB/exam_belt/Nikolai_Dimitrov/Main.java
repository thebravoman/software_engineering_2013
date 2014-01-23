import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.StringTokenizer;


public class Main {
        
        static List<Chart> list = new ArrayList<Chart>();
        
        static int counter = 0;
        
        public static void main(String[] args) {
        Scanner scanInput = new Scanner(System.in);
        while(true){
                
                
                
                String input = scanInput.nextLine();
                
                

                    StringTokenizer st = new StringTokenizer(input, ", ");
                    if(st.countTokens() == 1){
                            for (Chart c : list){
                                if (c instanceof PieChart){
                                        if(c.value2 > c.value1)((PieChart) c).stanislav();
                                }
                                System.out.println(c.value1 + " " + c.value2 + " " + c.value3);
                            }
                            break;
                    }
     
                    if(st.countTokens() != 4)continue;
                    int v1 = Integer.parseInt((String) st.nextElement());
                    int v2 = Integer.parseInt((String) st.nextElement());
                    int v3 = Integer.parseInt((String) st.nextElement());
                    if(st.nextElement().equals("p"))list.add(new PieChart(v1, v2, v3));
                    else list.add(new BarChart(v1, v2, v3));
                
        }
        }

}
