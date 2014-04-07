package com.elsys.crypto;


public class Main {
	
	public static void main(String[] args) {
		int[] publicKey = new int[2];
		int[] privateKey = new int[2];
		
		CreateKeys enc = new CreateKeys(128, 512);
		
		publicKey[0] = enc.getN();
		publicKey[1] = enc.getE();
		privateKey[0] = enc.getN();
		privateKey[1] = enc.getD();
		
		System.out.println("Public Key = " + publicKey[0] + ", " + publicKey[1]);
		System.out.println("Private Key = " + privateKey[0] + ", " + privateKey[1]);
	}
	
}
