public class Georgi_Iliev {

        public static void main(String[] args) {
              if(args[(args.length)-1] == "up"){
                 for (int k=0; k<args.length ;k++) {
                    System.out.println(System.getProperty(args[k]));              
                 }                  	
              }else{
                 for (int k=(args.length)-1; k>=0 ;k--){                               
                	 System.out.println(System.getProperty(args[k]));                                 
                 }    
              }
        }

}
