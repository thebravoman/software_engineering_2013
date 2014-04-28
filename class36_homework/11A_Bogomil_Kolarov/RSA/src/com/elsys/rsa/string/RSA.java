package com.elsys.rsa.string;

import java.math.BigInteger;
import java.util.Scanner;
import java.io.*;

public class RSA {

	public static void main(String[] args) throws IOException {
		
		Scanner in = new Scanner(System.in);
		
		BigInteger key1;
		BigInteger key2;
		
		String message;
		
		Crypto ednc;
		
		System.out.println("Enter command...");
		if(in.nextLine().toLowerCase().equals("encrypt")) {
			System.out.println("Enter public key: ");
			String key = in.nextLine();
			
			key1 = 	new BigInteger(key.split(" ")[0]);
			key2 = 	new BigInteger(key.split(" ")[1]);
			
			System.out.println("Enter message: ");
			message = in.nextLine();

			ednc = new Crypto(key1, key2, message);
			System.out.println("Your encrypted message: " + ednc.enDecrypt());
		
		}else {
			RSAKeys keys = new RSAKeys();
			System.out.println("Public key: " + keys.getE() + " " + keys.getN());
			System.out.println("Private key: " + keys.getD() + " " + keys.getN());
			
			System.out.println("Enter encrypted message: ");
			message = in.nextLine();

			ednc = new Crypto(keys.getD(), keys.getN(), message);
			System.out.println("Your decrypted message: " + ednc.enDecrypt());
		}
		in.close();
	}
}