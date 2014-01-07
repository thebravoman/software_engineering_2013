package org.elsys.plane;

import java.util.Random;

public class RandGen {
	public static int GenerateNum(){
		Random rand = new Random();
		return rand.nextInt(3)+1;
		
	}
}
