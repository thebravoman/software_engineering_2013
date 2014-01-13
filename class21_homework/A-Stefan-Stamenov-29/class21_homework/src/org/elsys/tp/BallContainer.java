package org.elsys.tp;

import java.util.LinkedList;

public class BallContainer {

	LinkedList<Ball> container= new LinkedList<Ball>();
	double capacity=0;
	
	boolean add(Ball ball){
		container.add(ball);
		capacity+=ball.getCapacity();
		return true;
	}

	void remove(Ball ball){
		container.remove(ball);
		capacity-=ball.getCapacity();
	}
	double getCapacity() {
		return capacity;
	}
	int size() {
		return container.size();
	}
	
	void clear() {
		container.clear();
		capacity=0;
	}
	
	boolean contains(Ball ball){
		return container.contains(ball);
		}
	}