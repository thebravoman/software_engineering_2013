import java.util.Scanner;

public class Bozhidar_Nikolov_2 {

	private static Scanner input = new Scanner(System.in);
	private static int n;
	private static int e;
	private static int d;
	private static int message;
	private static String command;
	
	private static void encryption() {
		message = (int)Math.pow(message, e);
		message %= n;
		System.out.println(message);
	}
	
	private static void decryption() {
		message = (int)Math.pow(message, d);
		message %= n;
		System.out.println(message);
	}
	
	public static void main(String[] args) {
		
		//I assume that the given arguments are, for example: 403, 67, 403, 43, message
		n = Integer.parseInt(args[0]);
		e = Integer.parseInt(args[1]);
		d = Integer.parseInt(args[3]);
		message = Integer.parseInt(args[4]);
		command = input.nextLine();
		
		if(command.equals("encrypt")) {
			encryption();
		} else {
			decryption();
		}
	}
}
