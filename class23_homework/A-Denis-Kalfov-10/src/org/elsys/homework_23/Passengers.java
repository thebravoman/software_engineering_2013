package org.elsys.homework_23;
import java.util.Random;

public class Passengers {
	int passengers;
	
	public Passengers(){
		Random generator = new Random();
		this.passengers = 1 + generator.nextInt(3);
	}


}
