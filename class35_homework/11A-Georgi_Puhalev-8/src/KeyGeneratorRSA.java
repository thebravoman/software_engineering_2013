
public class KeyGeneratorRSA extends RSA{
	public static void printKeys(){
		p = getP(counter, AllPrimes);
		q = getQ(counter, AllPrimes, p);
		n = getN(p, q);
		fn = getFN(p,q);
		e = getE(fn);
		d = getD(fn, e);
		System.out.println("Public Key = " + n + "," + e);
		System.out.println("Private Key = " + n + "," + d);
		System.out.println();
	}
	
	public static long getP(int counter, int[] AllPrimes){
		long p = AllPrimes[getRandNum(counter, 0)];
		return p;
	}
	
	public static long getQ(int counter, int[] AllPrimes, long p){
		long q = 0;
		while(true){
			q = AllPrimes[getRandNum(counter, 0)];
			if(p != q)
				break;
		}
		return q;
	}
	
	public static long getN(long p, long q){
		long n = p*q;
		return n;
	}
	
	public static long getFN(long p, long q){
		long fn = (p-1)*(q-1);
		return fn;
	}
	
	public static long getE(long fn){
		long e;
		while(true){
			e = getRandNum((int)fn, 2);
			if(Deliteli(e, fn))
				break;
		}
		return e;
	}
	
	public static long getD(long fn, long e){
		long d = 0;
		for(int i=1; i >0; i++){
			if( ( fn * i + 1 ) % e == 0 ){
				 d = (fn*i+1) / e;
				break;
			}
		}
		return d;
	}
	
	public static int getRandNum(int max, int min){
		int ranNum = min + (int)(Math.random() * ((max - min) + 1));
		return ranNum;
	}
	
	public static int getCount(int[] AllPrimes){
		int counter = 0;
		for (int i = 0; i < AllPrimes.length; i ++){
		    if (AllPrimes[i] > 0)
		        counter ++;
		}
		return counter;
	}
	
	public static boolean Deliteli(long e, long fn){
			for(int i = 2; i <= e; i++){
				if(e%i == 0 && fn%i ==0 ){
					return false;
				}
			}
		return true;
	}
}
