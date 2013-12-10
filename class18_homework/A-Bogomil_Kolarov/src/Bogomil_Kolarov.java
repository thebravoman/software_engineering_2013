public class Bogomil_Kolarov {

	public static void main(String[] args) {
		
		int count = 0;
		
		String[] property;
		property = new String[args.length];
		
		
		for(int i = 0; i < args.length; ++i) {
			if(!args[i].contains("java")) {
				property[count] = System.getProperty(args[i+1]);
				++count;
				i += 2;
				continue;
			}
			property[count] = System.getProperty(args[i]);
			++count;
		}
	
		if(args[args.length-1].equals("down")) {
			for(int i = args.length-2; i > 0; --i) {
				System.out.println(property[i-1]);
			}
		} else {
			for(int i = 0; i < args.length-2; ++i) {
				System.out.println(property[i]);
			}
		}
	}
}