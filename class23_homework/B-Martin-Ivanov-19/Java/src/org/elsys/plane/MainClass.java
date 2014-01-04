package org.elsys.plane;

public class MainClass {

	public static void main(String[] args) {
		
		RandomNumGenerator generator = new RandomNumGenerator();
		PlaneArranger arranger = new PlaneArranger();
		Airplane plane = new Airplane();
		
		arranger.arrangePlane(plane, generator);
		
	}

}
