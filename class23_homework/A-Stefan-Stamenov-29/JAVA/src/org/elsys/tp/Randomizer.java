package org.elsys.tp;

import java.util.Random;

public class Randomizer {
	public int generateRandom() {
		Random rand = new Random();
		return rand.nextInt(3) + 1;
	}

}