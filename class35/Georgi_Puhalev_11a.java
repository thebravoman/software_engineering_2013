public class GeorgiPuhalev11a {

	static int[] AllPrimes = {131, 137, 139, 149, 151, 157, 163, 167, 173 
		, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229 
		, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281 
		, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349 
		, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409 
		, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463 
		, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541 
		, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601 
		, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659 
		, 661, 673, 677, 683, 691, 701, 709, 719, 727, 733 
		, 739, 743, 751, 757, 761, 769, 773, 787, 797, 809 
		, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863 
		, 877, 881, 883, 887, 907, 911, 919, 929, 937, 941 
		, 947, 953, 967, 971, 977, 983, 991, 997,1009,1013,1019,1021};
	
	public static void main(String arg[]){
		int n = 389371, e = 1351, counter = 0, i;
		
		for (i = 0; i < AllPrimes.length; i ++){
		    if (AllPrimes[i] > 0)
		        counter ++;
		}
		for(i = 0; i < counter; i++){
			if(n % AllPrimes[i] == 0)
				break;
		}
		int p = n / AllPrimes[i];
		System.out.println("p = " + p);
		int q = n / p;
		System.out.println("q = " + q);
		int fn = (p-1)*(q-1);
		System.out.println("fn = " + fn);
		for(i=1; i >0; i++){
			if( ( fn * i + 1 ) % e == 0 ){
				 int d = (fn*i+1) / e;
				 System.out.println("d = " + d);
				break;
			}
		}
		
	}
}
