public class Alexander_Iliev {
	public static void main(String[] args){
		int check = 0;
		if (args.length == 0){
			System.out.println("No arguments!");
			
		}else {
			for(int i = 0;i < args.length;i++){
				if (args[args.length-1].equals("down")){
					check = args.length - i - 1;
				} else {
					check = i;
				}
				if (System.getProperty(args[check]) != null){
					System.out.println(System.getProperty(args[check]));
				}
			}
			
		}
		
	}
}
