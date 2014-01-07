package org.elsys.class21_homework;
import java.util.LinkedList;

public class BallContainer {
	protected LinkedList<Ball> balls = new LinkedList<Ball>();
	protected double capacity;

	public void add( Ball ball ) {
    	balls.add(ball);
        capacity+=ball.getCapacity();
    }

    public void remove( Ball ball ) {
    	balls.remove(ball);
        capacity-=ball.getCapacity();
    }

    public int size() {
        return balls.size();
    }

    public void clear() {
        balls.clear();
    }

    public boolean contains(Ball ball) {
        return balls.contains(ball);
    }
}
