import java.util.*;

public class BallContainer {

	private List<Ball> container = new LinkedList<Ball>();
	private double capacity;
	
	public void add(Ball b) {
		container.add(b);
		this.capacity++;
	}
	
	public void remove(Ball b) {
		container.remove(b);
		this.capacity--;
	}
	
	public double getCapacity() {
		return this.capacity;
	}
	
	public int size() {
		return this.container.size();
	}
	
	public void clear() {
		this.container.clear();
	}
	
	public boolean contains(Ball b) {
		return this.container.contains(b);
	}
	/*
1.add(Ball)
2.remove(Ball)
3.getCapacity()
4.size()
5.clear()
6.contains(Ball)  */
}