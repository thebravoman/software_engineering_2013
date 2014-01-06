import java.util.Scanner;


public class Main {
	
public static void main(String[] args) {
	Plane plane = new Plane();
	
	while (plane.free_seats > 0){		
		plane.addHumans();
		new Scanner(System.in).nextLine();
	}
	plane.printSeats();
	
}
}
