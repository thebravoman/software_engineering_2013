package org.elsys.se.class23.homework;
import java.util.*;

public class RandomInRange {
	private int lowerLimit;
	private int upperLimit;
	Random generator;

	
	public RandomInRange(int low, int high) {
		lowerLimit = low;
		upperLimit = high;
		generator = new Random();
	}

	
	public int generate() {

		return generator.nextInt(upperLimit - lowerLimit) + lowerLimit;

	}

}
