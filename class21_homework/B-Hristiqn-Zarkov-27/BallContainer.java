import java.util.LinkedList;
import java.util.List;


public class BallContainer {
	private List<Ball> content = new LinkedList<Ball>();
    private int capacity;
    
    public BallContainer(){
            this.content.clear();
            this.capacity = 0;
    }
    
    public void add(Ball ball){
            content.add(ball);
            this.capacity++;
    }
    
    public void remove(Ball ball){
            content.remove(ball);
            this.capacity--;
    }
    
    public int getCapacity() {
            return capacity;
    }
    
    public void clear(){
            content.clear();
    }
    
    public boolean contains(Ball ball){
            return content.contains(ball);
    }

    public List<Ball> getContent() {
            return content;
    }
}
