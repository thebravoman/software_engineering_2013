package org.elsys.homework;

import java.util.LinkedList;



public class BallContainer {
	protected LinkedList<Ball> balls;

	public BallContainer() {
		this.balls = new LinkedList<Ball>();
	}




	public void add(Ball b){
		balls.add(b);
	}
	
	public void remove(Ball b){
		balls.remove(b);
	}
	
	public double getCapacity(){
		double capacity = 0;
		for (int i=0;i< balls.size(); i++){
			capacity += balls.get(i).getCapacity();
		}
		return capacity;
	}
	
	public int size() {
		return balls.size();
	}
	
	public boolean conatins(Ball b){
		return balls.contains(b);
	}
	
	
}
