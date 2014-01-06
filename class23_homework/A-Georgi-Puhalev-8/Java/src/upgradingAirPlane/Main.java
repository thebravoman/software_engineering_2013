package upgradingAirPlane;

import java.io.IOException;


public class Main{
	public static void main(String[] args) throws IOException{
		System.out.println("For new plane press enter");
		System.in.read();
		Plane iWannaFly = new Plane();
		iWannaFly.airPlane();
	}
}