package class34_homework;

import java.io.IOException;

public class Main {
	static int[] AllPrimes = {131,137,139,149,151,157,163,167,173 ,179,181,191,193,197,199,211,223,227,229,233,239,241,251,257,263,269,271,277,281,283,293,307,311,313,317,331,337,347,349,353,359,367,373,379,383,389,397,401,409,419,421,431,433,439,443,449,457,461,463,467,479,487,491,499,503,509};
	static int counter = KeyGenerator.getCount(AllPrimes);
	static long p, q, n, fn, e, d;
	
	public static void main(String arg[]){
		System.out.println("Press enter to generate public and private key");
		try {
			System.in.read();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		KeyGenerator.printKeys();
		System.out.println("Press enter to encrypt or decrypt a message");
		try {
			System.in.read();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		EnDecryptor.nextMove();
	}		
}