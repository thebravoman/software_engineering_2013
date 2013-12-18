package org.elsys.tp;

import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;

public class Box extends BallContainer {

	private int maxCapacity;

	public Box(int capacity){
		maxCapacity=capacity;
	}
	
	public boolean add(Ball ball){
		if(capacity+ball.getCapacity()<maxCapacity){
			container.add(ball);
			return true;
	}else{
		return false;
	}
}
		public LinkedList<Ball> getBallsFromSmallest() {
            LinkedList<Ball> sorted = new LinkedList<Ball>(container);
            Collections.sort(sorted, new Comparator<Ball>() {
                    @Override
                    public int compare(Ball ball1, Ball ball2) {
                            return Double.compare(ball1.capacity, ball2.capacity);
                    }
            });
            return sorted;
    }
}