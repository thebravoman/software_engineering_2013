public class Martin_Kuzev {

        public static void main(String[] args){
                String check;
                if (args.length > 0){
                        if(args[args.length-1].equals("up")){
                                for (int i=0;i<(args.length-1);++i){
                                check = System.getProperty(args[i]);
                                        if (check != null){
                                                System.out.println(check);
                                        }
                                }
                        } else {
                                for (int i=(args.length-2);i>0;--i){
                                        check = System.getProperty(args[i]);
                                        if (check != null){
                                                System.out.println(check);
                                        }
                                }
                        }                 
                }
        
        }

}
