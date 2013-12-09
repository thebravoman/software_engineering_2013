class Bozhidar_Nikolov {

	static void up(String[] arguments) {
		for(int i = 0; i < arguments.length; i++) {
			checkProperty(arguments[i]);
		}
	}

	static void checkProperty(String property) {
		if(System.getProperty(property) != null) {
			System.out.println(System.getProperty(property));
		}
	}
	
	public static void main(String[] args) {
		
		if(args[args.length - 1].equals("up")) {
			up(args);
		} else if(!args[args.length - 1].equals("down") && !args[args.length - 1].equals("up")) {
			up(args);	
		} else {
			for(int i = args.length - 1; i >= 0; i--) {
				checkProperty(args[i]);
			}
		}
	}
}
