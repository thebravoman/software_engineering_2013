package Homework4;

import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;
import java.util.Collections;

public class Box extends BallContainer {
	
	private LinkedList<Ball> content = new LinkedList<Ball>();
	private double maxCapacity;
	
	public Box(double capacity){
		this.setMaxCapacity(capacity);
	}
	
	public void add(Ball newBall){
		if(this.getMaxCapacity() == content.size()){
			System.out.println("Box is full!");
		}else{
			this.content.add(newBall);
		}
	}
	
	public List<Ball> getBallsFromSmallest(){
		List<Ball> ballContent = content;		
		Collections.sort(ballContent, new Comparator<Ball>() {
			public int compare(Ball b1, Ball b2) {
				return Double.compare(b1.getCapacity(), b2.getCapacity()); // I admit that i copied it...
			}
		});
		
		return ballContent;
	}

	public double getMaxCapacity() {
		return maxCapacity;
	}

	public void setMaxCapacity(double maxCapacity) {
		this.maxCapacity = maxCapacity;
	}
	
	// MAIN
	public static void main(String[] args) {
		Box box = new Box(10);
		
		Ball ball1 = new Ball();
		ball1.setCapacity(10);
		box.add(ball1);
		
		Ball ball2 = new Ball();
		ball2.setCapacity(5);
		box.add(ball2);
		
		Ball ball3 = new Ball();
		ball3.setCapacity(2);
		box.add(ball3);
		
		Ball ball4 = new Ball();
		ball4.setCapacity(15);
		box.add(ball4);
		
		Object[] sortedBalls = box.getBallsFromSmallest().toArray();
		for(int i = 0; i < sortedBalls.length; i++){
			System.out.println(sortedBalls[i].toString());
		}
		
	}
}
