package org.elsys.plane;

public class PlaneArranger {

	public void arrangePlane(Airplane plane, RandomNumGenerator generator) {

		int num = 0;
		while (!(plane.isFull())) {

			num = generator.generateRandomNum();

			if (num == 1) {
				plane.addOnePassenger();
			} else if (num == 2) {
				plane.addTwoPassengers();
			} else if (num == 3) {
				plane.addThreePassengers();
			} else {
				System.out.println("The generator gave up a strange number!");
			}

		}
		plane.printSeats();
	}
}
