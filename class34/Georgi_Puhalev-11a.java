package class34.publicPrivateKey;

import java.util.Random;

public class Main {
	
	public static void main(String arg[]){
		int[] AllPrimes = {131,137,139,149,151,157,163,167,173 ,179,181,191,193,197,199,211,223,227,229,233,239,241,251,257,263,269,271,277,281,283,293,307,311,313,317,331,337,347,349,353,359,367,373,379,383,389,397,401,409,419,421,431,433,439,443,449,457,461,463,467,479,487,491,499,503,509};
		//66;
		int counter = 0;
		for (int i = 0; i < AllPrimes.length; i ++){
		    if (AllPrimes[i] > 0)
		        counter ++;
		}	
		
		Random r1 = new Random();
		int temp = r1.nextInt(counter);
		int p = AllPrimes[temp];
		System.out.println(p);
		Random r2;
		int q = 0;
		while(true){
			r2 = new Random();
			temp = r2.nextInt(counter);
			q = AllPrimes[temp];
			if(p != q)
				break;
		}
		
		System.out.println(q);
		
		int n = p*q;
		int fn = (p-1)*(q-1);
		System.out.println(fn);
		
		int e = 0;
		
		while(true){
			Random r3 = new Random();
			e = r3.nextInt(fn) + 2;
			
			if(Deliteli(e, fn))
				break;
		}
		
		System.out.println(e);
		
		//d*e = fn*i + 1;
	}	
	
	public static boolean Deliteli(int e, int fn){
			for(int i = 2; i <= e; i++){
				if(e%i == 0 && fn%i ==0 ){
					return false;
				}
			}
		return true;
	}
}
