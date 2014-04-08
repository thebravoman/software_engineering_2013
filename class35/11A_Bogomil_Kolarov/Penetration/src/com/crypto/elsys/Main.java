package com.crypto.elsys;

public class Main {

	public static void main(String[] args) {
		int n = 389371, e = 1351;
		int min = 128, max = 1024;
		int pC, qC, fnC;
		
		Penetrate p = new Penetrate();
		
		p.findPQ(min, max, n);
		
		pC = p.getP();
		qC = p.getQ();
		fnC = (pC - 1)*(qC - 1);
		
		
		
		System.out.println("p = " + p.getP());
		System.out.println("q = " + p.getQ());
	}
}
