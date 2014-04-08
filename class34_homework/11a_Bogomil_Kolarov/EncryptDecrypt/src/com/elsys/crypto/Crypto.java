package com.elsys.crypto;

import java.math.*;

public class Crypto {
	
	public void Encrypt(int n, int e, int m) {
		BigInteger bi = new BigInteger(String.valueOf(m));
		bi = bi.modPow(bi.valueOf(e), bi.valueOf(n));
		System.out.println("Encrypted: " + bi);
	}
	
	public void Decrypt(BigInteger cm, int d, int n) {
		BigInteger bi = new BigInteger(String.valueOf(cm));
		bi = bi.modPow(bi.valueOf(d), bi.valueOf(n));
		System.out.println("Decrypted: " + bi);
	}
}
