package org.elsys.se.class22_homework;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.LinkedList;

public class Main {
	public static void main( String[] args ) {
		List<Ball> balls = new LinkedList<Ball>();
		balls.add( new Ball( 1.0 ) );
		balls.add( new Ball( 4.0 ) );
		balls.add( new Ball( 3.0 ) );
		balls.add( new Ball( 2.0 ) );
		
		Collections.sort(balls, new Comparator<Ball>( ) {
			@Override
			public int compare( Ball a, Ball b ) {
				return Double.compare( a.capacity, b.capacity );
			}
		});
	}
}