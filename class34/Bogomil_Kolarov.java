package com.elsys.crypto;


public class Bogomil_Kolarov {
	static int primeNums[] = {131, 137, 139, 149, 151, 157, 163, 167, 173 
				, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229 
				, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281 
				, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349 
				, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409 
				, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463 
				, 467, 479, 487, 491, 499, 503, 509};
	
	public static void main(String[] args) {
		
		
		int p = primeNums[getPrime(primeNums.length)];
		int q = p;
		
		while(q == p) {
			q = primeNums[getPrime(primeNums.length)];
		}
		
		int n = p*q;
		int fn = (p-1)*(q - 1);
		
		int e = getE(fn);
		
		
	}
	
	private static int getE(int fn) {
		int min = 2;
		int max = fn;
		int e = min + (int)(Math.random()*max);
		
		boolean check = false;
		
		for(int dev = 2; dev < e; dev++) {
			if(e%dev == 0 && fn%dev == 0 ) {
				check = false;
				e = min + (int)(Math.random()*max);
			}
		}
		
		
		
		return 0;
	}
	
	private static int getPrime(int count) {
		int nRand = 1 + (int)(Math.random()*count);		
		return nRand;
	}
	
	
	

}
