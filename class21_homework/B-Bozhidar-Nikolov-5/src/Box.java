import java.util.*;

public class Box extends BallContainer {
	
	private List<Ball> container = new LinkedList<Ball>();
	private double maxCapacity;
	private double capacity;
	
	public Box() {
		maxCapacity = 10;
	}
	
	public Box(double capacity) {
		this.maxCapacity = capacity;
	}
	
	public void add(Ball b) {
		if(capacity == maxCapacity) {
			System.out.println("No space left in the box!");
		} else {
			this.container.add(b);
			capacity++;
			System.out.println(capacity);
		}
	}
	
	public void remove(Ball b) {
		if(capacity == 0) {
			System.out.println("Box is already empty!");
		} else {
			this.container.remove(b);
			capacity--;
		}
	}
	
	public void getBallsFromSmallest() {
		Ball[] sorted = new Ball[(int) maxCapacity];
		
		for(int i = 0; i < maxCapacity; i++) {
			sorted[i] = container.get(i);
		}
		
		for(int i = 0; i < sorted.length; i++) {
			for(int j = 0; j < sorted.length; j++) {
				if(sorted[i].getCapacity() < sorted[j].getCapacity()) {
					Ball swap = sorted[i];
					sorted[i] = sorted[j];
					sorted[j] = swap;
				}
			}
		}
		
		for(int i = 0; i < sorted.length; i++) {
			System.out.println(sorted[i].getCapacity());
		}
	}
}
