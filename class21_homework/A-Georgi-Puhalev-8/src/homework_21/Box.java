package homework_21;

import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;

public class Box extends BallContainer{
	double maxCapacity;
	
	public Box(double capacity){
		maxCapacity = capacity;
	}
	
	public boolean add(Ball ball){
		if((capacity+ball.getCapacity())>maxCapacity){
			return false;
		}else{
			container.add(ball);
			capacity += ball.getCapacity();
			return true;
		}
	}
	
	public LinkedList<Ball> getBallsFromSmallest(){
		LinkedList<Ball> sorted = new LinkedList<Ball>(container);
		Collections.sort(sorted, new Comparator<Ball>() {

			@Override
			public int compare(Ball ball1, Ball ball2) {
				return Double.compare(ball1.capacity, ball2.capacity);
				// TODO Auto-generated method stub
			}
			
		});
		return sorted;		
	}
}
