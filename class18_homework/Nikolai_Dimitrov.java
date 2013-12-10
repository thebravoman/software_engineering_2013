
public class Properties {
        public static void main(String[] args){
                String property;
        
                if (args[args.length-1].equals("down") ){
                        for (int i = args.length-1; i+1 > 0;i--) {
                                p = System.getProperty(args[i]);
                        
                        if (p != null)
                                System.out.println(p);
                        }
                }        
                else{
                         for (int i = 0; i < args.length; i++) {
                                         p  = System.getProperty(args[i]);
                                        if (p != null)
                                                System.out.println(p);
                                        
                                }
                }
        }
