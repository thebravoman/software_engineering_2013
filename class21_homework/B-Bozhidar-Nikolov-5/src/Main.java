import java.util.*;

public class Main {
	
	static Scanner input = new Scanner(System.in);
	
	public static void main(String[] args) {
	
		Box myBox = new Box(10);
		int i = 0;
		while(i < 11) {
			Ball currentBall = new Ball();
			System.out.println("Enter ball's capacity: ");
			double capacity = input.nextDouble();
			currentBall.setCapacity(capacity);
			myBox.add(currentBall);
			i++;
		}
		
		myBox.getBallsFromSmallest();
	}
	
}
