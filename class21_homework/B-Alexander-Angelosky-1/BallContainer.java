package ball;

import java.util.LinkedList;

public class BallContainer {
	protected LinkedList<Ball> content;
	protected double usedSpace;
	
	public BallContainer(){
		content = new LinkedList<Ball>();
		usedSpace = 0;
	}
	public void add(Ball b){
		content.add(b);
		usedSpace+=b.getCpacity();
	}
	public void remove(Ball b){
		content.remove(b);
		usedSpace-=b.getCpacity();
	}
	public double getCapacity(){
		return usedSpace;
	}
	public int size(){
		return content.size();
	}
	public void clear(){
		content.clear();
	}
	public boolean contains(Ball b){
		return content.contains(b);
	}
	
}
