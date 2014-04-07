import java.math.BigInteger;

public class Main {
	
	public static int p;
	public static int q;
	public static int n;
	public static int fn;
	public static int e;
	public static int d;
	public static int m;
	public static int cm;
	static int temp;
	
	public static int randNum(int min, int max){
		return min + (int)(Math.random() * ((max - min) + 1));
	}
	
	public static boolean checkIfPrime(int num) {
		for(int i = 2; i < 256; i++){
			if(num % i == 0){
				return false;
			}
		}
		return true;
	}
	
	private static int gcdThing(int a, int b) {
	    BigInteger b1 = new BigInteger(""+a);
	    BigInteger b2 = new BigInteger(""+b);
	    BigInteger gcd = b1.gcd(b2);
	    return gcd.intValue();
	}
	
	public static void main(String[] args) {
		
		p = 31;
		q = 13;
		
		n = q*p;
		fn = (p - 1)*(q - 1);
		
		do{
			e = randNum(1,360);
			temp = gcdThing(e, fn);
		}while(temp != 1);
		
		for(int i = 0; i < 10000; i++){
			if(((i*e) % fn) == 1){
				d = i;
				break;
			}
		}
		
		System.out.println("n = " + n + "\nfn = " + fn + "\ne = " + e);
		System.out.println("D = " + d);

		System.out.println("public = " + n + ", " + e);
		System.out.println("private = " + n + ", " + d);
	}
}
