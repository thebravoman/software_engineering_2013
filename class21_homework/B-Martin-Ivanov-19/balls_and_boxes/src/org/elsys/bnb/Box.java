package org.elsys.bnb;

import java.util.LinkedList;
import java.util.Comparator;
import java.util.Collections;

public class Box extends BallContainer {
	final protected double maxCapacity;
	
	public Box(double maxCapacity){
		super();
		this.maxCapacity = maxCapacity;
	}

	public double getCapacity() {
		return capacity;
	}

	@Override
	public boolean add(Ball b) {
		if(this.capacity + b.getCapacity() > maxCapacity){
			return false;
		}
		return super.add(b);
	}	
	
	public LinkedList<Ball> getBallsFromSmallest(){
		LinkedList<Ball> sortBalls = new LinkedList<Ball>(ballList);
        
		Collections.sort(sortBalls, new Comparator<Ball>() {
        	public int compare(Ball b1, Ball b2) {
        		return Double.compare(b1.getCapacity(), b2.getCapacity());
        	}
		});
        return sortBalls;
	}
	
	
}
