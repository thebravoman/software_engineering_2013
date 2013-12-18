import java.util.LinkedList;

public class BallContainer {
	
    private LinkedList<Ball> content= new LinkedList<Ball>();
    private int capacity;
    
    public BallContainer(){
           capacity = 0;
    }
    
    public void add(Ball newone){
    	content.add(newone);
    	capacity++;
    	
    }
    public void remove(Ball newone){
    	content.remove(newone);
    	capacity--;
    }
    public int getCapacity(){
    	return capacity;
    }
    public boolean contains(Ball newone){
    	return content.contains(newone);
    	
    }
    public void clear(){
    	content.clear();
    }
    public int size(){
    	return content.size();
    }
    
}
