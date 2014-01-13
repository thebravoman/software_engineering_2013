import java.util.LinkedList;

public class BallContainer {
	int capacity;
	LinkedList<Ball> list = new LinkedList<Ball>();
	
	public BallContainer() {
		capacity = 0;
	}
	
	public boolean add(Ball newBall) {
		list.add(newBall);
		this.capacity += newBall.capacity;
		return true;
	}
	
	public void remove(Ball ball) {
		list.remove(ball);
		this.capacity -= ball.capacity;
	}
	
	public int getCapacity() {
		return this.capacity;
	}
	
	public int size() {
		return list.size();
	}
	
	public void clear() {
		capacity = 0;
		list.removeAll(list);
	}
	
	public boolean contains(Ball ball) {
		return list.contains(ball);
	}
	
}
