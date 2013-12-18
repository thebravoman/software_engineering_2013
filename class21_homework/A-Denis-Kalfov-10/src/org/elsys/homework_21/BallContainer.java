package org.elsys.homework_21;

import java.util.LinkedList;

public class BallContainer extends Ball{
	
	public BallContainer(int capacity) {
		super(capacity);
	}

	public static LinkedList<Ball> balls = new LinkedList<Ball>();
	
	
	public void add(Ball b) {
		balls.add(b);
		
		capacity+=b.getCapacity();
	}
	
	public void remove(Ball b){
		balls.remove(b);
		
		capacity-=b.getCapacity();		
	}
	
	public int getCapacity(){
		return capacity;
	}

	public int size(){
		return balls.size();
	}
	
	public void clear(){
		balls.clear();
		capacity=0;
	}
	
	
}
