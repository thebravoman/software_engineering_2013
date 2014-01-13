package homework_21;

import java.util.LinkedList;

public class BallContainer {
	
	double capacity = 0.0;
	LinkedList<Ball> container= new LinkedList<Ball>();
	
	public void clear(){
		container.clear();
		capacity = 0.0;
	}
	
	public boolean add(Ball ball){
		if (container.add(ball)){
			capacity += ball.getCapacity();
			return true;
		}else{
			return false;
		}
	}
	
	public boolean remove(Ball ball){
		container.remove(ball);
		capacity -= ball.getCapacity();
		return true;
	}
	
	public double getCapacity(){
		return this.capacity;
	}
	
	public boolean contains(Ball ball){
		if (container.contains(ball))
			return true;
		return false;
	}

	public double size(LinkedList<Ball> container){
		if (container.isEmpty()){
			return 0;
		}else{
			return container.size();
		}
	}
	
}
