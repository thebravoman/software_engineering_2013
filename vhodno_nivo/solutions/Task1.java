import java.util.Scanner;


public class Task1 {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in); 
		int x = scan.nextInt();
		int y = scan.nextInt();
		
		int sum = 0;
		for(int i=x;i<y;i++){
			if (i%2==1)
				sum = sum +i;
		}
		System.out.println(sum);
	}
}
