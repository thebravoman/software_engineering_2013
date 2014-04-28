import java.io.IOException;
import java.math.BigInteger;
import java.util.Scanner;

public class EnDecryptorRSA extends Main{
	
	public static String lineFromKb(){
		Scanner keyboard = new Scanner(System.in);
		String string = keyboard.nextLine();
		return string;
	}
	
	public static void Encrypting(long n, long e){
		System.out.println("Insert the message to be encrypted");
		int m = intFromKb();
		BigInteger encrMessage = BigInteger.valueOf(m).modPow(BigInteger.valueOf(e),BigInteger.valueOf(n));
		System.out.println("Your encrypted message is: " + encrMessage);
		System.out.println();
		pressEnter();
	}
	
	public static void Decrypting(long n, long d){
		System.out.println("Insert the message to be decrypted");
		int m = intFromKb();
		BigInteger decrMessage = BigInteger.valueOf(m).modPow(BigInteger.valueOf(d),BigInteger.valueOf(n));
		System.out.println("The decrypted message is:  " + decrMessage);
		System.out.println();
		pressEnter();
	}
	
	public static void NewKey(int choice){
		System.out.println("Please, insert a key");
		String kit = lineFromKb();
		String[] kInput = kit.split(",");
		long n = Integer.parseInt(kInput[0]);
		long e = Integer.parseInt(kInput[1]);
		if(choice == 1)
			Encrypting(n, e);
		else
			Decrypting(n,e);
	}
	
	public static void pressEnter(){
		System.out.print("Press enter to continue");
		try {
			System.in.read();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	
	public static void nextMove(){
		while(true){
			System.out.println("Enter 1 to encrypt a message");
			System.out.println("Enter 2 to decrypt а message");
			System.out.println("Enter anything else to close the program");
	
			int choice = intFromKb();
			switch(choice){
				case 1: NewKey(choice);
					break;
				case 2: NewKey(choice);
					break;
				default: System.out.println("Exiting program.");			
			}
			System.out.println();
			if(choice != 1 && choice != 2){
				break;
			}
		}
	}
}
