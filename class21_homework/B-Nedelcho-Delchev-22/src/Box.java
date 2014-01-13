import java.util.Comparator;
import java.util.LinkedList;
import java.util.Collections;

public class Box extends BallContainer{
	double maxCapacity;
	private int capacity;
    
    public Box(double maxCapacity){
            super();
            this.maxCapacity = maxCapacity;
    }

	public Box(int capacity) {
		this.capacity = capacity;
	}
	@Override
    public void add(Ball bls) {
	    if (this.capacity < this.capacity){
	    	balls.add(bls);
	    	this.capacity += 1;
	    }else {
	    	System.out.println("Box is Full!");
	    }
 	}        
    
    public LinkedList<Ball> getBallsFromSmallest(){
            LinkedList<Ball> sortBalls = new LinkedList<Ball>(balls);
            
            Collections.sort(sortBalls, new Comparator<Ball>() {
	            public int compare(Ball b1, Ball b2) {
	                    return Double.compare(b1.getCapacity(), b2.getCapacity());
	            }
            });
            return sortBalls;
    } 
}
