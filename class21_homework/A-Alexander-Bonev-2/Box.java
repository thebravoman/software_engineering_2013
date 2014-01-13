package hw21;

import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;

public class Box extends BallContainer {
    
    private LinkedList<Ball> content = new LinkedList<Ball>();
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
    
    public boolean add(Ball newBall){
            if(maxCapacity <= content.size()){
                    System.out.println("Error:Box is full!");
            }else{
                    this.content.add(newBall);
            }
			return false;
    }
    
    public LinkedList<Ball> getBallsFromSmallest(){
            LinkedList<Ball> sortedContent = content;
            Collections.sort(sortedContent, new Comparator<Ball>() {
                    public int compare(Ball b1, Ball b2) {
                            return Double.compare(((Ball) b1).getCapacity(), ((Ball) b2).getCapacity());
                    }
            });
            return sortedContent;
    }
}