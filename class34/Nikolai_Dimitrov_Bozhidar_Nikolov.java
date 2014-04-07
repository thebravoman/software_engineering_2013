import java.util.*;
import java.math.BigInteger;

public class Nikolai_Dimitrov_Bozhidar_Nikolov {

	public static void main(String[] args) {

		int primeNumbers[] = {131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251};
		int p;
		int q;
		int n;
		int fn;
		int e = 1;
		int d = 1;
		Random randomIndex = new Random();
		p = primeNumbers[randomIndex.nextInt(22 - 0 + 1) + 0];
		q = primeNumbers[randomIndex.nextInt(22 - 0 + 1) + 0];
		while(q == p) {
			q = primeNumbers[randomIndex.nextInt(22 - 0 + 1) + 0];
		}
		n = p * q;
		fn = (p - 1) * (q - 1);
		BigInteger b1 = new BigInteger("" + (fn-1));
		BigInteger b2 = new BigInteger("" + fn);
		BigInteger gcd = b1.gcd(b2);
		int i = 2;
		while(gcd.intValue() != 1) {
			b1 = new BigInteger("" + (fn - i));
			gcd = b1.gcd(b2);
			i++;
		}
		e = gcd.intValue();
		System.out.println(n + ", " + e);
		System.out.println(n + ", " + d);
	}

}
