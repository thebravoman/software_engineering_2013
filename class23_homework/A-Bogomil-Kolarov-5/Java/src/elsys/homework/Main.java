package elsys.homework;

public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Plane passengers = new Plane(27, 6);
		
		passengers.prepare();
		passengers.print();
	}

}
