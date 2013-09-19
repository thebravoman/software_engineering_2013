import java.util.Scanner;

public class Kaloian_Pavlov_17{
	public static void start(){
		int x = 0 ;
		Scanner sc = new Scanner(System.in);
		
		do{
			x = sc.nextInt();
		}while(x<0 && x>10);
		long[] arr = new long[10];
		long[] fib = new long[150];
		fib[0] = 1;
		fib[1] = 1;
		fib[2] = 2;
		int t = 0;
		int z = 0;
		do{
			fib[t+2] = fib[t] + fib[t+1];
			if(fib[t] % x == 0){
				arr[z] = Math.abs(fib[t]);
				z++;
			}
			t++;
		}while(z<10);
		for(int i = 0 ;i<10 ;i++){
			System.out.println(arr[i]);
		}
	}
	
	public static void main(String[] args){
		Kaloian_Pavlov_17 use = new Kaloian_Pavlov_17();
		Kaloian_Pavlov_17.start();
	}
}
