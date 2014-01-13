import java.util.LinkedList;

public class BallContainer {
	protected double capacity = 0.0;
	
	LinkedList<Ball> contents = new LinkedList<Ball>();
	
	public boolean add(Ball ball) {
		if(contents.add(ball)) {
			capacity += ball.capacity;
			return true;
		} else {
			return false;
		}
	}
	
	public boolean remove(Ball ball) {
		if(contents.remove(ball)) {
			ball.capacity -= ball.capacity;
			return true;
		}
			return false;
	}
	
	public double getCapacity() {
		return this.capacity;
	}
	
	public int size(LinkedList<Ball> contents) {
		return contents.size();
	}
	
	public void clear() {
		contents.clear();
		this.capacity = 0.0;
	}
	
	public boolean contains(Ball ball) {
		if(contents.contains(ball)) {
			return true;
		} else {
			return false;
		}
	}
	
}
