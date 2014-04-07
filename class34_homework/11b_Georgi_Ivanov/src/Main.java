import java.math.BigInteger;

public class Main {
	private static int p, q, n, fn, e, d, temp;
	
	public static int randNum(int min, int max){
		return min + (int)(Math.random() * ((max - min) + 1));
	}
	
	private static int gcdThing(int a, int b) {
	    BigInteger b1 = new BigInteger(""+a);
	    BigInteger b2 = new BigInteger(""+b);
	    BigInteger gcd = b1.gcd(b2);
	    return gcd.intValue();
	}
	
 	public static boolean isPrime(long n) {
	    if(n < 2) return false;
	    if(n == 2 || n == 3) return true;
	    if(n%2 == 0 || n%3 == 0) return false;
	    long sqrtN = (long)Math.sqrt(n)+1;
	    for(long i = 6L; i <= sqrtN; i += 6) {
	        if(n%(i-1) == 0 || n%(i+1) == 0) return false;
	    }
	    return true;
	}
	
	public static void main(String[] args) {
		do{
			do{
				p = randNum(128, 256);
			}while(isPrime(p) == false);
			
			do{
				q = randNum(128, 256);
			}while(isPrime(q) == false);
		}while(p == q);
		
		System.out.println("p = " + p + "\nq = " + q);
		
		n = q*p;
		fn = (p - 1)*(q - 1);
		
		do{
			e = randNum(1,360);
			temp = gcdThing(e, fn);
		}while(temp != 1);
		
		while(true){
			d++;
			if(d*e % fn == 1) 
				break;
		}

		System.out.println("n = " + n + "\nfn = " + fn + "\ne = " + e + "\nd = " + d);
	
		System.out.println("public = " + n + ", " + e);
		System.out.println("private = " + n + ", " + d);
	}
}