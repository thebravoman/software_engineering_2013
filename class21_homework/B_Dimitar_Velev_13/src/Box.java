import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;

public class Box extends BallContainer {
        private int boxCapacity;
        
        public Box(int boxCapacity) {
                this.boxCapacity = boxCapacity;
        }
        
        public void add(Ball ball) {
                if(List.size()<boxCapacity) {
                        List.add(ball);
                        capacity+=ball.capacity;
                }
        }
        public LinkedList<Ball> getBallsFromSmallest() {
        
			LinkedList<Ball> fromSmallest = new LinkedList<Ball>((Collection<? extends Ball>) this);
            Collections.sort(fromSmallest, new Comparator<Ball>() {
                    @Override
                    public int compare(Ball b1, Ball b2) {
                            return Double.compare(b1.capacity, b2.capacity);
                    }
            });
            return fromSmallest;
    }
}