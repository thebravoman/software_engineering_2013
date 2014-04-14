import java.io.IOException;
import java.math.BigInteger;
import java.util.Random;

public class KeyGeneratorDSA{
	
	public static void keyGeneratorDSA() throws Exception{
		int q = getQ(160, 1);
		//System.out.println("q = " + q);
		
		int p = getP(1024, q);
		//System.out.println("p = " + p);
		
		int g = getG(q, p);
		//System.out.println("g = " + g);
		
		int x = getRandNum(q, 1);
		//System.out.println("x = " + x);
		
		int y = getY(g, x, p);
		//System.out.println("y = " + y);
		System.out.println();
		System.out.println("Public key: " + p + "," + q + "," + g + "," + y);
		System.out.println("Private key: " + x);
		System.out.println();
		System.out.println("To start over press enter");
		try {
			System.in.read();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Main.main(null);
		
		
	}
	
	
	
	public static int getQ(int max, int min){
		int q = 0;
		q = getRandNum(max, min);
		while(true){
			if(isPrime(q) && q != 149 && q != 157 && q != 109)
				break;
			q++;
		}
		
		return q;
	}
	
	public static int getP(int max, int q){
		int p = getRandNum(max, q);
		int i;
		boolean flag = true;
		
		for (i = p; i <= max; i++){
			if(isPrime(i) && (i-1) % q == 0){
				flag = false;
				break;
			}
		}
		
		if(flag){
			for(i = p; i > q; i--){
				if(isPrime(i) && (i-1) % q == 0){
					break;
				}
			}		
		}
		
		p = i;
		
		
		return p;
	}
	
	public static int getG(int q, int p){
		int h = 2;
		BigInteger check = BigInteger.valueOf(1);
		BigInteger g = check;
		while(g == check){
			g = BigInteger.valueOf(h).modPow(BigInteger.valueOf((p-1)/q),BigInteger.valueOf(p));
			h++;
		}
		return g.intValue();
	}
	
	public static int getRandNum(int max, int min){
		Random rand = new Random();
		int ranNum = rand.nextInt((max - min) + 1) + min;
		return ranNum;
	}
	
	static boolean isPrime(int n) {
	    if(n < 2) return false;
	    if(n == 2 || n == 3) return true;
	    if(n%2 == 0 || n%3 == 0) return false;
	    int sqrtN = (int) (Math.sqrt(n)+1);
	    for(long i = 6L; i <= sqrtN; i += 6) {
	        if(n%(i-1) == 0 || n%(i+1) == 0) return false;
	    }
	    return true;
	}
	
	public static int getY(int g, int x, int p){
		BigInteger y = BigInteger.valueOf(0);
		while(y == BigInteger.valueOf(0)){
			y = BigInteger.valueOf(g).modPow(BigInteger.valueOf(x),BigInteger.valueOf(p));
		}
		return y.intValue();
	}	
}