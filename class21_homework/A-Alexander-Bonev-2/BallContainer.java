package hw21;

import java.util.*;

public class BallContainer {
        protected double capacity;
        private List<Ball> balls = new LinkedList<Ball>();
        
        public BallContainer() {
                this.capacity = 0.0;
        }
        
        public boolean add(Ball ball) {
                if(this.balls.add(ball)) {
                        this.capacity += ball.getCapacity();
                        return true;
                }
                return false;
        }
        
        public boolean remove(Ball ball) {
                if(this.balls.remove(ball)) {
                        this.capacity -= ball.getCapacity();
                        return true;
                }
                return false;
        }
        
        public double getCapacity() {
                return this.capacity;
        }
        
        public int size() {
                return this.balls.size();
        }
        
        public void clear() {
                this.balls.clear();
        }
        
        public boolean contains(Ball ball) {
                return this.balls.contains(ball);
        }
}