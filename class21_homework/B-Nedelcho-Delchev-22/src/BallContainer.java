import java.util.LinkedList;

public class BallContainer {
	 protected LinkedList<Ball> balls = new LinkedList<Ball>();
	 private int capacity;
	 
	 public BallContainer(){
		 this.capacity = 0;
	 }
	 
	 public void add(Ball bls){
		 balls.add(bls);
		 this.capacity++;
	 }
	 
	 public void remove(Ball bls){
		 balls.remove(bls);
		 this.capacity--;
	 }
	 
	 public int getCapacity(){
		 return capacity;
	 }
	 
	 public void clear(){
		balls.clear();
	 }
	 
	 public boolean contains(Ball bls){
		 return balls.contains(bls);
	 }
}
