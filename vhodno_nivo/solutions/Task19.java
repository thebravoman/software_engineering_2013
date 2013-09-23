import java.util.Scanner;


public class Task19 {

	public static void main(String[] args) {
		Scanner a = new Scanner(System.in);
		 
		float x = a.nextFloat();
		int tp1 =1;
		double sum = 0.0;
		for(int i=1;;i++) {
			if((1.0/i)<x) break;
			if(isPrime(i)) {
				if(i-tp1 == 2) {
					System.out.println(tp1);
					System.out.println(i);
					System.out.println();
					sum = sum +(1.0/i) + (1.0/tp1);
				}
				tp1 = i;
			}
		}
		System.out.println(sum);
	}
	//11, 2 -- 11 
	private static boolean isPrime(int number) {
		for(int i=2; i<number; i++){
	           if(number%i == 0){
	               return false; 
	           }
	        }
	        return true; 
	}
	
}
