public class Mihail_Kirilov_21 {

	public static void main(String[] args) {
		if(args[args.length-1].equals("down")) {
			for(int i = 0; i <= args.length-1; i++) {
				if(System.getProperty(args[i]) != null) {
					System.out.println(System.getProperty(args[i]));
				}
			} 
		}else {
			for(int i = args.length-2; i >= 0; i--) {
				if(System.getProperty(args[i]) != null) {
					System.out.println(System.getProperty(args[i]));
				}
			}
		}
	}
}