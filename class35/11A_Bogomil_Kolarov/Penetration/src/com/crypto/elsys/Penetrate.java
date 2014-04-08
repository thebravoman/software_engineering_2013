package com.crypto.elsys;

public class Penetrate {
	int p = 0, q = 0, d = 0;
	
	
	public int getP() {
		return p;
	}

	public int getQ() {
		return q;
	}
	
	public int getD() {
		return d;
	}
	/*
	public void setD() {
		int d = 0;
		while(true) {
			if(e * d % fn == 1) {
				break;
			}
			++d;
		}

		return d;
	}*/

	public void findPQ(int min, int max, int n) {
		int p = 0, q = 0;
		
		for(int count = min; count < max; ++count) {
			if(isPrime(count) && n % count == 0) {
				if(p == 0) {
					p = count;
				}else if(q == 0) {
					q = count;
				}
 			}
		}
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
