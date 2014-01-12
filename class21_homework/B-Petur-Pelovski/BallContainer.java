package neshto;
import java.util.LinkedList;


	public class BallContainer {
        protected double capacity;
        protected LinkedList<Ball> topkaList = new LinkedList<Ball>();
        
        public boolean add(Ball b){
                if (topkaList.add(b)){
                        this.capacity += b.getCapacity();
                        return true;
                }
                return false;
        }
        
        public double getCapacity() {
                return this.capacity;
        }
        
        public boolean remove(Ball b){
                if (topkaList.remove(b)){
                        this.capacity -= b.getCapacity();
                        return true;
                }
                return false;
        }
        
        public double size(){
                return topkaList.size();
        }
        
        public void clear(){
                topkaList.removeAll(topkaList);
                capacity = 0.0;
        }
        
        public boolean contains(Ball b){
                return topkaList.contains(b);
        }
}
