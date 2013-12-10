public class Kristian_Popov {
        public static void main(String[] args) {
              if(args[(args.length)-1] == "down"){
              	    for (int j=(args.length)-1; j>=0 ;j--){
                    System.out.println(System.getProperty(args[j]));
                 }         
              }else{
				            for (int j=0; j<args.length ;j++) {
                    System.out.println(System.getProperty(args[j]));
                 }
              }
        }
}
