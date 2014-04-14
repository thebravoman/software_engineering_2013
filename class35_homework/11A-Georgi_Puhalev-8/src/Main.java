import java.util.Scanner;


public class Main {

	public static void main(String arg[]) throws Exception{
		System.out.println("Enter 1 for RSA");
		System.out.println("Enter 2 for DSA");
		int choice =0;
		
		while(choice != 1 || choice != 2){
			choice = intFromKb();
			switch(choice){
				case 1: RSA.rsa();;
					break;
				case 2: DSA.dsa();
					break;
			}
		}
	}
	
	public static int intFromKb(){
		Scanner keyboard = new Scanner(System.in);
		int INT = keyboard.nextInt();
		keyboard.nextLine();
		return INT;
	}
	
}
