package com.elsys.crypto;

import java.math.BigInteger;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
	
		Scanner input = new Scanner(System.in);
		Crypto crypto = new Crypto();	
	
		System.out.println("enter command: ");
		String command = input.next().toLowerCase();
		
		if(command.equals("encrypt")) {
			int n, e, m;
			System.out.println("enter N");
			n = input.nextInt();
			
			System.out.println("enter E");
			e = input.nextInt();
			
			System.out.println("enter message");
			m = input.nextInt();
			
			crypto.Encrypt(n, e, m);
		}
		
		if(command.equals("decrypt")) {
			int d, n;
			
			BigInteger cm;
			
			System.out.println("enter encrypted message: ");
			cm = input.nextBigInteger();
			
			System.out.println("enter d");
			d = input.nextInt();
			
			System.out.println("enter n");
			n = input.nextInt();
			
			crypto.Decrypt(cm, d, n);
		}

		
		
		
	}

}
