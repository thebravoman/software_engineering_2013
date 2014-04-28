package com.elsys.rsa.string;

import java.math.BigInteger;

public class Crypto {

	String text;
	String message;
	
	BigInteger key1;
	BigInteger key2;

	public Crypto(BigInteger key1, BigInteger key2, String message) {
		this.key1 = key1;
		this.key2 = key2;
		this.message = message;
	}
	
	public String enDecrypt() {
		byte[] byteMessage = message.getBytes();
		return new String((new BigInteger(byteMessage)).modPow(key1, key2).toByteArray());
	}

}
