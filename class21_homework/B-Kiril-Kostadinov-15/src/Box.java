import java.util.Comparator;
import java.util.Collections;
import java.util.LinkedList;

public class Box extends BallContainer {
	int boxCapacity;
	
	public Box(int max){
		super();
		this.boxCapacity = max;
	}
	
	@Override
	public boolean add(Ball newBall){
		if(newBall.getCapacity() + this.getCapacity() < this.boxCapacity) {
			list.add(newBall);
			return true;
		}
		return false;
	}
	
	public LinkedList<Ball> getBallsFromSmallest() {
		LinkedList<Ball> sorted = new LinkedList<Ball>(list);
		Collections.sort(sorted, new Comparator<Ball>() {
			public int compare(Ball ball1, Ball ball2) {
				if(ball1.getCapacity() > ball2.getCapacity()) {
					return 1;
				} else {
					if(ball1.getCapacity() < ball2.getCapacity()) {
						return -1;
					} else {
						return 0;
					}
				}
			}
		});
		return sorted;
	}
}
