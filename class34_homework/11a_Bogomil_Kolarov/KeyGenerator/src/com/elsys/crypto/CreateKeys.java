package com.elsys.crypto;

public class CreateKeys {
	int p;
	int q;
	int n;
	int d;
	int e;
	int fn;
	
	public CreateKeys(int min, int max) {
		p = generateRandomPrimeInRange(min, max);
		q = p;
		
		while(q == p) {
			q = generateRandomPrimeInRange(min, max);
		}
		
		n = setN(p,q);
		fn = setFN(p, q);
		e = setE(fn);
		d = setD(e, fn);		
	}
	
	public int getN() {
		return n;
	}
	
	public int getD() {
		return d;
	}
	
	public int getE() {
		return e;
	}
	
	private boolean hasCommonDivisor(int num1, int num2) {
		for(int i = 2; i <= num1; ++i) {
			if(num1%i == 0 && num2%i == 0)
				return false;
		}
		return true;
	}
	
	private int getRandomNumber(int min, int max) {
		int rand = min + (int)(Math.random() * max);
		return rand;
	}
	
	private int setN(int p, int q) {
		int n;
		n = p*q;
		return n;
	}
	
	private int setFN(int p, int q) {
		int fn;
		fn = (p - 1)*(q - 1);
		return fn;
	}
	
	private int setE(int fn) {

		int e = 0;
		while(e == 0) {
			int temp = getRandomNumber(1, fn);
			if(isPrime(temp)) {
				if(hasCommonDivisor(temp, fn))
					e = temp;
			}
		}
		
		return e;
	}

	private int setD(int e, int fn) {
		int d = 0;
		while(true) {
			if(e * d % fn == 1) {
				break;
			}
			++d;
		}

		return d;
	}
	
	private int generateRandomPrimeInRange(int min, int max) {
		int randomPrime = 0;
		boolean isPrime = false;
		
		while(!isPrime) {
			randomPrime = getRandomNumber(min, max);
			isPrime = isPrime(randomPrime);
		}
		
		return randomPrime;
	}
	
	private boolean isPrime(int number) {	
		double boundary = Math.floor(Math.sqrt(number));

		if (number == 1) return false;
		if (number == 2) return true;

		for (int i = 2; i <= boundary; ++i) {
			if (number % i == 0) return false;
		}

		return true;
	}
}
