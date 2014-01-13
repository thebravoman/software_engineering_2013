package org.elsys.hw21;
import java.util.LinkedList;

public class BallContainer {
	
	LinkedList<Ball> balls = new LinkedList<Ball>();
	protected int capacity = 0;
	
	public boolean add(Ball b){
		balls.add(b);
		capacity += b.getCapacity();
		return true;
	}
	
	public void remove(Ball b){
		balls.remove(b);
		capacity -= b.getCapacity();
	}
	
	public int getCapacity() {
		return capacity;
	}
	
	public int size(){
		return balls.size();
	}
	
	public void clear(){
		balls.clear();
		capacity = 0;
	}
	
	public boolean contains(Ball b){
		return balls.contains(b);
	}
}
