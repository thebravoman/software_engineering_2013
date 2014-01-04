import java.util.LinkedList;

public class BallContainer
{
        LinkedList<Ball> balls = new LinkedList<Ball>();
        protected int capacity = 0;
        
        public void add(Ball b)
        {
                balls.add(b);
                capacity+=b.capacity;
        }
        
        public void remove(Ball b)
        {
                balls.remove(b);
                capacity-=b.capacity;
        }

        public int getCapacity()
        {
                return capacity;
        }
        
        public int size()
        {
                return balls.size();
        }
        
        public void clear()
        {
                balls.clear();
        }
        
        public boolean contains(Ball b)
        {
                return balls.contains(b);
        }
        
}
