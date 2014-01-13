public class Dimitar_Velev {
public static void main(String[] args){
int n = 0;
if(args.length==0){
	System.out.println("Missing arguments.");	
}
else{
	for(int i=0; i<args.length;i++){
		if(args[args.length-1].equals("down")){
			n = args.length-i-1;
		}
		else{
			n = i;
			}
			if (System.getProperty(args[n])!=null){
				System.out.println(System.getProperty(args[n]));
			}
	}
}
}
}
