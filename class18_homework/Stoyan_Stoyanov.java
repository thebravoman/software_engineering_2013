package stoyan_home;

public class Stoyan_Stoyanov {
    public static void main(String[] args) {
            if(args.length == 0) {
                    System.out.println("No arguments.");
            } 
            
            else {
                    if(args[(args.length)-1] == "down"){
                    	int i = (args.length)-1;
                    	while ( i >= 0 ){
                    		i--;
                    		if (System.getProperty(args[i])!=null) {
                    			System.out.println(System.getProperty(args[i]));
                    		}
                    	}
                    }
                    
                    else {
                    	int i = 0;
                    	while ( i < args.length) {
                    		i++;
                    		if (System.getProperty(args[i])!=null) {
                    			System.out.println(System.getProperty(args[i]));
                    		}
                    	}
                    }
            }
    		}
}
