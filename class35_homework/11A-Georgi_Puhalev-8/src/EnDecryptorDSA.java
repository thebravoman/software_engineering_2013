import java.io.IOException;
import java.math.BigInteger;


public class EnDecryptorDSA extends Main{
	public static void enDeCryptorDSA() throws Exception{
		System.out.println("Insert p");
		int p = intFromKb();
		System.out.println("Insert q");
		int q = intFromKb();
		System.out.println("Insert g");
		int g = intFromKb();
		System.out.println("Insert y");
		int y = intFromKb();
		
		System.out.println("Public key: " + p + "," + q + "," + g + "," + y);
		
		System.out.println("Insert message");
		int m = intFromKb();
		
		
		System.out.println("Insert x");
		int x = intFromKb();
	
		
		int k = KeyGeneratorDSA.getRandNum(q, 1);
		//System.out.println("k = " + k);
		
		int r = getR(g, k, p, q);
		//System.out.println("r = " + r);
		
		int s = getS(k, m, x, r, q);
		//System.out.println("s = " + s);
		
		System.out.println("r,s = " + r + "," + s);
		
		System.out.println("To start over press enter");
		try {
			System.in.read();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Main.main(null);
		
	}
	
	public static int getR(int g, int k, int p, int q){
		BigInteger r = BigInteger.valueOf(0);
		while(r == BigInteger.valueOf(0)){
			r = (BigInteger.valueOf(g).modPow(BigInteger.valueOf(k),BigInteger.valueOf(p))).mod(BigInteger.valueOf(q));
		};
		return r.intValue();
	}
	
	
	public static int getS(int k, int m, int x, int r, int q) throws NumberFormatException, Exception{
		int s = 0;
		while(s == 0){
			s = (((encrypt(Integer.toOctalString(m)) + x*r)/k) % q);
		};
		return s;
	}
	
	public static int encrypt(String x) throws Exception {
		java.security.MessageDigest digest = null;
		digest = java.security.MessageDigest.getInstance("SHA-1");
		digest.reset();
		digest.update(x.getBytes("UTF-8"));
		return java.nio.ByteBuffer.wrap(digest.digest()).getInt();
	}
}
