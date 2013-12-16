package ball;

import java.util.Iterator;

public class Box extends BallContainer{
	private double capacity;
	public Box(double capacity){
		super();
		setCapacity(capacity);
	}
	public void setCapacity(double capacity){
		if(capacity>0){
			this.capacity = capacity;
		}
		else{
			this.capacity = 1;
		}
	}
	@Override
	public void add(Ball b){
		if(super.usedSpace+b.getCpacity()>capacity){
			System.out.println("NO MORE SPACE!");
		}
		else{
			super.add(b);
		}
	}
	public Ball getBallsFromSmallest(){
		Iterator it = super.content.listIterator();
		Ball smallest = (Ball)it.next();
		while(it.hasNext()){
			Ball next = (Ball)it.next();
			if(next.getCpacity()<smallest.getCpacity()){
				smallest = next;
			}
		}
		super.remove(smallest);
		return smallest;
	}
	
}
