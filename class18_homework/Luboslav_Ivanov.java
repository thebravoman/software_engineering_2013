
public class Properties {
	public static void main(String[] args){
		String property;
	
		if (args[args.length-1].equals("down") ){
			for (int i = args.length-1; i+1 > 0  ; i--) {
				property = System.getProperty(args[i]);
			
			if (property != null)
				System.out.println(property);
			}
		}	
		else{
			 for (int i = 0; i < args.length; i++) {
				 	property = System.getProperty(args[i]);
					if (property != null)
						System.out.println(property);
					
				}
		}
	}
}
