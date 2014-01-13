package H04;

import java.util.LinkedList;

public class BallContainer {
	
	private LinkedList<Ball> content = new LinkedList<Ball>();
	private int capacity;
	
	public BallContainer(){
		this.content.clear();
		this.capacity = 0;
	}
	
	public void add(Ball newBall){
		content.add(newBall);
		this.capacity++;
	}
	
	public void remove(Ball ball){
		content.remove(ball);
		this.capacity--;
	}
	
	public int getCapacity() {
		return capacity;
	}
	
	public void clear(){
		content.clear();
	
	}
	
	public boolean contains(Ball ball){
		return content.contains(ball);
	}

	public LinkedList<Ball> getContent() {
		return content;
	}
}
