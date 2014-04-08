package class34_homework;

import java.io.IOException;
import java.util.Scanner;

public class EnDecryptor extends Main{
	public static int intFromKb(){
		@SuppressWarnings("resource")
		Scanner keyboard = new Scanner(System.in);
		int INT = keyboard.nextInt();
		keyboard.nextLine();
		return INT;
	}
	
	public static String lineFromKb(){
		@SuppressWarnings("resource")
		Scanner keyboard = new Scanner(System.in);
		String string = keyboard.nextLine();
		return string;
	}
	
	public static void Encrypting(long n, long e){
		System.out.println("Insert the message to be encrypted");
		int m = intFromKb();
		long encrMessage = (long)Math.pow(m,e)%n;
		System.out.println("Your encrypted message is: " + encrMessage);
		pressEnter();
	}
	
	public static void Decrypting(long n, long d){
		System.out.println("Insert the message to be decrypted");
		int m = intFromKb();
		long decrMessage = (long)Math.pow(m,d)%n;
		System.out.println("The decrypted message is:  " + decrMessage);
		pressEnter();
	}
	
	public static void NewKey(){
		System.out.println("Please, insert a key");
		String kit = lineFromKb();
		String[] kInput = kit.split(",");
		long n = Integer.parseInt(kInput[0]);
		long e = Integer.parseInt(kInput[1]);
		Encrypting(n, e);
	}
	
	public static void pressEnter(){
		System.out.println("Press enter to continue");
		try {
			System.in.read();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	
	public static void nextMove(){
		while(true){
			System.out.println("Enter 1 to encrypt а message with your public key");
			System.out.println("Enter 2 to encrypt а message with someone elses public key");
			System.out.println("Enter 3 to decrypt а message");
			System.out.println("Enter anything else to close the program");
	
			int choice = intFromKb();
			switch(choice){
				case 1: Encrypting(n, e);
					break;
				case 2: NewKey();
					break;
				case 3: Decrypting(n, d);
					break;
				default: System.out.println("Exiting program.");			
			}
			System.out.println();
			if(choice != 1 && choice != 2 && choice != 3){
				break;
			}
		}
	}
}
