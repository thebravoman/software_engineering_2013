import java.util.Scanner ;
 
 	public class Martin_Kuzev_18 {
 	
 		public void mich () {
 			
 			int x = 0 ;
 			int i = 0 ;
 			int t = 0 ;
 			int g = 0 ;
 			int[] arr = new int[10];
 			Scanner sc = new Scanner(System.in) ;
 			do {
 			x = sc.nextInt() ;
 			}while(x<0) ;
 			
 			for (i=1 ; i = x ; i= i+2) {
 			
 			if (x % i == 0){
 			arr[t] = i ;
 			}
 			}
 			for (g=0 ; g = 10 ; g++){
 			System.out.println(arr[g]) ;
 			}
 			}
 		public static void main(String[] args) {
 		Martin_Kuzev_18 trap = new Martin_Kuzev_18() ;
 		trap.mich();
 		}
 	}
 		
 		
