import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;

public class Box extends BallContainer {
	private double maxCapacity;
	
	public Box(double capacity) {
		maxCapacity = capacity;
	}
	
	public boolean add(Ball ball) {
		if(capacity + ball.capacity < maxCapacity) {
			contents.add(ball);
			capacity += ball.getCapacity();
			return true;
		} else {
			return false;
		}
	} 
	
	public LinkedList<Ball> getBallsFromSmallest(){
        LinkedList<Ball> sorted = new LinkedList<Ball>(contents);
        Collections.sort(sorted, new Comparator<Ball>() {
                @Override
                public int compare(Ball ball1, Ball ball2) {
                	return Double.compare(ball1.capacity, ball2.capacity);
                }   
        });
        return sorted;                
	}
	
}
