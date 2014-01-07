package homework;

import java.io.IOException;

public class Main {
	public void boarding() throws IOException {
		Airplane Fly = new Airplane();
		Number_of_passengers Number = new Number_of_passengers();
		int passengers=0,group=0;
		Fly.printer();
		while(passengers<162) {
			System.in.read();
			group = Number.Generate_passengers();
			passengers+=group;
			Fly.accommodation(group);
			Fly.printer();
		}
	}
	
	public static void main(String[] args) throws IOException {
		Main plane = new Main();
		plane.boarding();
	}
}
