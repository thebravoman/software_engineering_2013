package homework;

import java.io.IOException;

public class Main {
	public void planeFiller() throws IOException {
		Plane airbusA320 = new Plane();
		HumanGenerator generator = new HumanGenerator();
		int people=0,group=0;
		airbusA320.writeSeats();
		while(people<162) {
			System.in.read();
			group=generator.generateHumans();
			people+=group;
			airbusA320.fillSeats(group);
			airbusA320.writeSeats();
		}
	}
	
	public static void main(String[] args) throws IOException {
		Main plane = new Main();
		plane.planeFiller();
	}
}