import java.util.Random;


public class Main {
	
	public static void main(String[] args) {
		int p, q, e=0, d, n, fn, rand=0, success=0;
		Random random = new Random();
		int prime[] = {131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251};
		
		p = prime[random.nextInt(22)];
		q = prime[random.nextInt(22)];
		while (q==p) {
			q = prime[random.nextInt(22)];
		}
		System.out.println(p + " - " + q);
		n = p*q;
		fn = (p-1)*(q-1);
		rand = random.nextInt(50)+1;
		for (int i=2;i<fn;i++){
			if (GCD(i, fn) == 1){
				e = i;
				success++;
			}
			if (success == rand) break;
		}
		System.out.println(e);
		
	}
	
	public static int GCD(int a, int b) {
		if (b==0) return a;
		return GCD(b,a%b);
	}
}
