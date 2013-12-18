package org.elsys.se.class21.homework;
import java.util.*;


public class Box extends BallContainer {
	private double maxCapacity;
	
	public Box(double maxCap) {
		super();
		this.maxCapacity = maxCap;
	}
	
	@Override
	public boolean add(Ball ball) {
		if(ball.getCapacity() + this.getCapacity() <= this.maxCapacity) {
			if(super.add(ball)) {
				this.capacity += ball.getCapacity();
				return true;
			}
		}
		return false;
	}
	
	public List<Ball> getBallsFromSmallest() {
		List<Ball> small = new ArrayList<Ball>();
		Collections.sort(small, new Comparator<Ball>() {

			@Override
			public int compare(Ball one, Ball two) {
				return Double.compare(one.getCapacity(), two.getCapacity());
			}
			
		});
		return small;
	}
	
	
}
