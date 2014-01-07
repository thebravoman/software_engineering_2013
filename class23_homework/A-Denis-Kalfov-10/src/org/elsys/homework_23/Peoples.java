package org.elsys.homework_23;

import java.util.Random;

public class Peoples {
	int peoples;
	
	public Peoples(){
	     Random generator = new Random();
	     this.peoples = 1 + generator.nextInt(3);
	}

	public int getPeoples() {
		return this.peoples;
	}
	
}
