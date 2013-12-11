public class Georgi_Ivanov{
	public static void main(String[] args){
		if((!args[args.length-1].equals("up"))&&(!args[args.length-1].equals("down"))){
			System.out.println("Invalid command... Last argument must be 'up' or 'down'");
		}else{
			if(args[args.length-1].equals("down")){
				for(int i = 0; i < args.length / 2; i++){
					String temp = args[i];
					args[i] = args[args.length - i - 1];
					args[args.length - i - 1] = temp;
				}
			}
			for(int i = 0; i < args.length; i++){
				if(System.getProperty(args[i]) != null){
					System.out.println(System.getProperty(args[i]));
				}
			}
		}
	}
}

//java.version java.vm.version java.vendor invalid java.vendor.url down