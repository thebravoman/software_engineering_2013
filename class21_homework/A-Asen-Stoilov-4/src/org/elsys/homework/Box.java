package org.elsys.homework;


import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;

public class Box extends BallContainer{
	private double capacity;
	private double maxcapacity;
	
	public Box(double max) {
		this.capacity = 0;
		this.maxcapacity = max;
	}
	
	public void add(Ball b){
		this.capacity +=b.getCapacity();
		if(maxcapacity >= capacity){
			super.add(b);
		} else {
			System.out.println("The box is full!!!");
		}
	}
	
	public LinkedList<Ball> getBallsFromSmallest(){
		LinkedList<Ball> sorted = new LinkedList<Ball>(balls);
		
		Collections.sort(sorted, new Comparator<Ball>() {
			
			public int compare(Ball b1, Ball b2) {
	             return Double.compare(b1.getCapacity(), b2.getCapacity());
	         }

	     });
		return sorted;
	}
}
