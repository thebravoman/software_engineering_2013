
public class Hristiqn_Zarkov {
	public static void main(String[] args) {
		for(int i = 0; i < args.length-1; i++) {
			String info;
			int index = args.length-1;
			if(args[index ].equals("down")){
				info = System.getProperty(args[index-(i+1)]);
			}else{
				info = System.getProperty(args[i]);
			}
			if(info != null){
				System.out.println(info);
			}
		}
	}
}
