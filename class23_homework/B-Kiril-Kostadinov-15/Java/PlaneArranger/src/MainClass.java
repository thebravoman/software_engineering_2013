
public class MainClass {

	public static void main(String[] args) {
		int remainingSeats = 27*6;
		int numberOfPeople;
		Plane plane = new Plane();
		while (remainingSeats > 0) {
			numberOfPeople = 1 + (int)(Math.random() * 3);
			if (remainingSeats - numberOfPeople < 0) {
				continue;
			}
			remainingSeats -= numberOfPeople;
			plane.addPeople(numberOfPeople);
		}
		plane.print();
	}

}
