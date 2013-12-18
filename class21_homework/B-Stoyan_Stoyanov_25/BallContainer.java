import java.util.LinkedList;

public class BallContainer {
        protected double capacity;
        protected LinkedList<Ball> ballList = new LinkedList<Ball>();
        
        public boolean add(Ball b){
                if (ballList.add(b)){
                        this.capacity += b.getCapacity();
                        return true;
                }
                return false;
        }
        
        public double getCapacity() {
                return this.capacity;
        }
        
        public boolean remove(Ball b){
                if (ballList.remove(b)){
                        this.capacity -= b.getCapacity();
                        return true;
                }
                return false;
        }
        
        public double size(){
                return ballList.size();
        }
        
        public void clear(){
                ballList.removeAll(ballList);
                capacity = 0.0;
        }
        
        public boolean contains(Ball b){
                return ballList.contains(b);
        }
}
