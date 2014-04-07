import java.io.IOException;
import java.util.Scanner;

public class Encryption_Decryption {
	private static Scanner in;
	private static int n, e, d, m;
	private static int  crypm = 0, decrypm = 0;
	private static String mode;	
	private static String[] pubKey, priKey;
 	
	public static void main(String[] args) throws IOException {
		in = new Scanner(System.in);
		System.out.println("Please input the public key");
		pubKey = in.nextLine().split(",");
		n = Integer.parseInt(pubKey[0]);
		e = Integer.parseInt(pubKey[1]);
		System.out.println("Please input the private key");
		priKey = in.nextLine().split(",");
		d = Integer.parseInt(priKey[1]);
		
		System.out.println("Please insert a numeric message");
		m = in.nextInt();
		
		System.out.println("Please insert 'e' for encrypt or 'd' for decrypt");
		mode = in.next();
				
		if(mode.equals("e")){
			crypm = (int) (Math.pow(m, e) % n);
			System.out.println("Original message = " + m + "\nCrypted message = " + crypm);
		}else if(mode.equals("d")){
			decrypm = (int) (Math.pow(crypm, d) % n);
			System.out.println("Crypted message = " + m +"\nDecryped message = " + decrypm);
		}
	}
}
