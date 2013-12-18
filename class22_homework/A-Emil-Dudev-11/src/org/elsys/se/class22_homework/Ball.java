package org.elsys.se.class22_homework;

public class Ball implements Comparable<Ball> {
	protected double capacity;

	public Ball( double capacity ) {
		this.capacity = capacity;
	}

	public double getCapacity( ) {
		return this.capacity;
	}

	public int compareTo( Ball ball ) {
		return Double.compare( this.capacity, ball.capacity );
	}
}
