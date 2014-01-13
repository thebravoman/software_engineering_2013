import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;


public class Box extends BallContainer{
        double capacity;
        
        public Box(double capacity) {
                this.capacity = capacity;
        }
        
        void add(Ball b){
                if (this.size < this.capacity){
                        ballList.add(b);
                        this.size += 1;
                }else {
                        System.out.println("Kutiqta e pulna 6efe!");
                }
        }
        
        LinkedList<Ball> getBallsFromSmallest(){
                Collections.sort(ballList, new Comparator<Ball>() {
         @Override
         public int compare(Ball b1, Ball b2) {
         return Double.compare(b1.capacity, b2.capacity);
         }
                });
                return ballList;
        }
}
