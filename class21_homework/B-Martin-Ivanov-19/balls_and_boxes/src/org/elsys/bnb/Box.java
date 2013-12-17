package org.elsys.bnb;

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
	
	
}
