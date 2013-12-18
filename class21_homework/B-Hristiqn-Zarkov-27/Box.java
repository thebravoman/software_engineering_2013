
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;
import java.util.Collections;

public class Box extends BallContainer {
        
        private List<Ball> content = new LinkedList<Ball>();
        private int maxCapacity;

        public double getMaxCapacity() {
                return maxCapacity;
        }
        
        public void setMaxCapacity(int maxCapacity) {
                this.maxCapacity = maxCapacity;
        }
        
        public Box(int capacity){
                this.setMaxCapacity(capacity);
        }
        
        public void add(Ball newBall){
                if(maxCapacity <= content.size()){
                        System.out.println("Error:Box is full!");
                }else{
                        this.content.add(newBall);
                }
        }
        
        public List<Ball> getBallsFromSmallest(){
                List<Ball> sortedContent = content;
                Collections.sort(sortedContent, new Comparator<Ball>() {
                        public int compare(Ball b1, Ball b2) {
                                return Double.compare(b1.getCapacity(), b2.getCapacity());
                        }
                });
                return sortedContent;
        }
}