package Homework23;

public class MainClass {
	public static void main(String[] args) {
		Plane plane = new Plane(27,6,3); // 27 row, 6 seats per row, The walkway is after the 3rd seat
		plane.fillPlane();
		plane.printAllSeats();
		plane.flyPlane(); // A plane must fly!!!
	}
}
