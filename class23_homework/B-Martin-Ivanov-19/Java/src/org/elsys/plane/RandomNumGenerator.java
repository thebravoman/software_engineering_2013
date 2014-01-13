package org.elsys.plane;

import java.util.Random;

public class RandomNumGenerator {
	
	public int generateRandomNum(){
		Random randomizer = new Random();
		return ((randomizer.nextInt(3)) + 1);
	}
	
}
