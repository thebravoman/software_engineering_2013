package com.elsys.rsa.string;

import java.math.BigInteger;
import java.util.Random;

public class RSAKeys {

	private BigInteger p;
	private BigInteger q;
	private BigInteger N;
	private BigInteger fn;
	private BigInteger e;
	private BigInteger d;
	private int bitlength = 128;
	private Random r;

	public RSAKeys() {
		r = new Random();
		p = BigInteger.probablePrime(bitlength, r);
		q = BigInteger.probablePrime(bitlength, r);
		N = p.multiply(q);

		fn = p.subtract(BigInteger.ONE).multiply(q.subtract(BigInteger.ONE));
		e = BigInteger.probablePrime(bitlength / 2, r);

		while (fn.gcd(e).compareTo(BigInteger.ONE) > 0 && e.compareTo(fn) < 0) {
			e.add(BigInteger.ONE);
		}
		d = e.modInverse(fn);
	}
	
	
	public BigInteger getN() {
		return N;
	}
	
	public BigInteger getE() {
		return e;
	}
	
	public BigInteger getD() {
		return d;
	}
	
}
