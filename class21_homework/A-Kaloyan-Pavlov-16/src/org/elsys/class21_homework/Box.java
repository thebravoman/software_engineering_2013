package org.elsys.class21_homework;

import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;

public class Box  extends BallContainer{
	private double maxCapacity;
	
	public Box(double maxCapacity)
	{
		this.maxCapacity = maxCapacity;
	}
	
	public void add(Ball ball) {
        if(ball.getCapacity()<maxCapacity) {
                balls.add(ball);
                capacity+=ball.capacity;
        }
	}

	public LinkedList<Ball> getBallsFromSmallest() {
        LinkedList<Ball> fromSmallest = new LinkedList<Ball>((Collection<? extends Ball>) this);
        Collections.sort(fromSmallest, new Comparator<Ball>() {
                @Override
                public int compare(Ball o1, Ball o2) {
                        return Double.compare(o1.getCapacity(), o2.getCapacity());
                }
        });
        return fromSmallest;
	}
}
