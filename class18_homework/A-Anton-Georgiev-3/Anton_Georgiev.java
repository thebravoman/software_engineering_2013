public class Anton_Georgiev {
	public static void main(String[] args) {
		int i=0,j,len;
		String check;
		if(args.length>0) {
			if(args[args.length-1].equals("down")) {
				j=-1;
				len=args.length-1;
				i=args.length-2;
			} else {
				j=1;
				len=args.length;
			}
			while((i<len) && (i>-1)) {
				if((check=System.getProperty(args[i])) != null) {
					System.out.println(check);
				}
				i+=j;
			}
		}
	}
}
