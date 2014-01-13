import java.util.LinkedList;


public class BallContainer {
        double capacity;
        int size;
        LinkedList<Ball> List = new LinkedList<>();
        
        public BallContainer() {
                this.size = 0;
        }
        
        void add(Ball n){
                List.add(n);
                this.size += 1;
        }
        
        boolean contains(Ball n){
            return List.contains(n);
        }
        
        void remove(Ball n){
                List.remove(n);
                this.size -= 1;
        }
        public double getCapacity(){
			return capacity;
        }

        void clear(){
                List.clear();
                this.size = 0;
        }
}