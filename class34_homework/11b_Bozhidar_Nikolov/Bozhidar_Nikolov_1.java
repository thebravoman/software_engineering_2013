import java.math.BigInteger;
import java.util.Random;

public class Bozhidar_Nikolov_1 {

	public static int[] primeNumbers = {131, 137, 139, 149, 151, 
			157, 163, 167, 173, 179, 
			181, 191, 193, 197, 199, 
			211, 223, 227, 229, 233, 
			239, 241, 251};
	public static int p;
	public static int q;
	public static int n;
	public static int fn;
	public static int e;
	public static int d;
	public static Random randomIndex = new Random();
	
	private static int greatestCommonDivisor(int a, int b) {
	    BigInteger b1 = new BigInteger(""+a);
	    BigInteger b2 = new BigInteger(""+b);
	    BigInteger gcd = b1.gcd(b2);
	    return gcd.intValue();
	}
	
	public static void main(String[] args) {
		
		p = primeNumbers[randomIndex.nextInt(23)];
		q = primeNumbers[randomIndex.nextInt(23)];
		
		while(q == p) {
			q = primeNumbers[randomIndex.nextInt(23)];
		}
		
		n = p * q;
		fn = (p - 1) * (q - 1);
		
		e = randomIndex.nextInt((fn - 1) - 2 + 1) + 2;
		while(greatestCommonDivisor(e, fn) != 1) {
			e = randomIndex.nextInt((fn - 1) - 2 + 1) + 2;
		}
		
		d = 1;
		while(d * e % fn != 1) {
			d++;
		}
		
		System.out.println("pub = " + n + ", " + e);
		System.out.println("priv = " + n + ", " + d);
	}
	
}
