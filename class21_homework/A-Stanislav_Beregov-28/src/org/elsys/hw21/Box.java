package org.elsys.hw21;

import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;

public class Box extends BallContainer {
	
	private final int maxCapacity;
	
	public Box(int capacity) {
		maxCapacity = capacity;
	}
	
    public boolean add(Ball b) {
        if(capacity + b.getCapacity() > maxCapacity)return false;
        return super.add(b);
   }
    
    public LinkedList<Ball> getBallsFromSmallest( ) {
        LinkedList<Ball> sorted = new LinkedList<Ball>(balls);
        Collections.sort( sorted, new Comparator<Ball>() {
                public int compare(Ball b1, Ball b2) {
                        return Double.compare(b1.getCapacity(), b2.getCapacity());
                }
        });
        return sorted;
    }
}
