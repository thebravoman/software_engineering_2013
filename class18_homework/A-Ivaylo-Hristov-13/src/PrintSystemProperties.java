public class PrintSystemProperties {

	public static void main(String[] args) {
		if (args[args.length - 1].equals("up")) {
			for (int argElement = 0; argElement < args.length - 1; argElement++) {
				if (System.getProperty(args[argElement]) != null)
					System.out.println(System.getProperty(args[argElement]));
			}
		} else if (args[args.length - 1].equals("down")) {
			for (int argElement = args.length - 2; argElement >= 0; argElement--) {
				if (System.getProperty(args[argElement]) != null)
					System.out.println(System.getProperty(args[argElement]));
			}
		}
	}

}
