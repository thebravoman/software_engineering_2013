package org.elsys.se.class21_homework;

import java.util.LinkedList;

public class BallContainer extends LinkedList<Ball> {
	protected double capacity = 0.0;

	public boolean add( Ball ball ) {
		if ( super.add( ball ) ) {
			this.capacity += ball.capacity;
			return true;
		}

		return false;
	}

	public boolean remove( Ball ball ) {
		if( super.remove( ball ) ) {
			this.capacity -= ball.capacity;
			return true;
		}

		return false;
	}

	public double getCapacity( ) {
		return this.capacity;
	}

	public void clear( ) {
		super.clear( );
		this.capacity = 0.0;
	}
}
