public class Yulian_Razkazov {
	public static void main(String[] args) {
		int i=0;
		if(args[args.length-1].equals("down")) {
			i=args.length-1;
			while(i>=0) {
				if(System.getProperty(args[i])!=null) {
					System.out.println(System.getProperty(args[i]));
				}
				i--;
			}
		}
		else {
			while(i<args.length) {
				if(System.getProperty(args[i])!=null) {
					System.out.println(System.getProperty(args[i]));
				}
				i++;
			}
		}
	}
}
