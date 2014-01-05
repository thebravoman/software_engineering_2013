package org.elsys.tp;

import java.io.IOException;

public class Filler {
	public void planeFiller() throws IOException {
		Plane airbusA320 = new Plane();
		Randomizer generator = new Randomizer();
		int people = 0, group = 0;
		System.out.println("The default values of the seats in the plane");
		airbusA320.print();
		System.out.println("-------------------------------");
		System.out.println("Please press Enter to continiute ...");
		while (people < 162) {
			System.in.read();
			group = generator.generateRandom();

			System.out.print("number of people which is getting in : ");
			System.out.println(group);
			if (airbusA320.collocation(group) == 1) {
				people += group;
			}
			airbusA320.print();
			System.out.println("------------------------");
			System.out.print("Number of people in the plane : ");
			System.out.println(people);
			System.out.println("Please press Enter to continiute ...");
		}
	}
}
