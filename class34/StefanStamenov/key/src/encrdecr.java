import java.io.IOException;
import java.util.Scanner;

public class encrdecr {
	public static void main(String[] args) throws IOException {

	int n,e,d,m,cm,dm;
	Scanner input=new Scanner(System.in);

	System.out.println("Vuvedete 'n' ");
	n=input.nextInt();
	System.out.println("Vuvedete 'e' ");
	e=input.nextInt();
	System.out.println("Vuvedete 'd' ");
	d=input.nextInt();
	System.out.println("Vuvedete message ");
	m=input.nextInt();
	System.out.println("Izberete 'c' ili 'd': ");
	char cho=(char) System.in.read();
	
	if (cho=='c'){
		cm= ((int) Math.pow(m, e))%n;
		System.out.println("cripted message "+cm);
	}else if(cho=='d'){
		dm=((int) Math.pow(m, d))%n;
		System.out.println("Decripted message "+dm);
	}else{
			System.out.println("Wrong char");
	}
	
	}
	
}
