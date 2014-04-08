import java.math.BigInteger;
import java.util.Scanner;


public class Main {
	public static void main(String[] args) {
		String[] output;
		int i=0,e=0,d=0;
		BigInteger n=BigInteger.valueOf(0),m=BigInteger.valueOf(0),c=BigInteger.valueOf(0);
		Scanner s = new Scanner(System.in);
		System.out.println("Enter public key: ");
		while (i<3){
			output = (s.nextLine()).split(",");
			switch (i){
			case 0:
				n = BigInteger.valueOf(Integer.parseInt(output[0]));
				e = Integer.parseInt(output[1]);
				System.out.println("Enter private key: ");
				break;
			case 1:
				d = Integer.parseInt(output[1]);
				System.out.println("Enter message to crypt");
				break;
			case 2:
				m = BigInteger.valueOf(Integer.parseInt(output[0]));
				break;
			}
			i++;
		}
		
		c = trick(m, e).mod(n);
		System.out.println("Encrypted messsage is: " + c);		
		m = trick(c, d).mod(n);
		System.out.println("Decrypted messsage is: " + m);
	}
	
	
	static BigInteger trick(BigInteger a,int b){
		for (int i=0;i<b;i++){
			a = a.multiply(a);
		}		
		return a;
	}
}
