public class Georgi_Puhalev {

	public static void main(String[] args) {

		int all_elements = args.length;

		if (all_elements != 0){
			
			int co;
			String str;
			
			if(args[(all_elements)-1].equals( "up" )){
		
				for (co=0; co<all_elements ;co++) {
					str = System.getProperty(args[co]);
					if (str != null){
						System.out.println( str );              
					}
				} 
			
			}else{
		
				for (co=(all_elements-1); co>=0 ;co--){                               
					str = System.getProperty(args[co]);
					if (str != null){
						System.out.println( str );              
					}                                 
				}
			
			}
		}
	}
}
