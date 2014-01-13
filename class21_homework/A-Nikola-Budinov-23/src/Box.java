
import java.util.LinkedList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;

public class Box extends BallContainer
{
	private double boxCapacity;
	
	public Box(double boxCapacity)
	{
		this.boxCapacity = boxCapacity;
	}
	
	public void add(Ball b)
	{
		if (balls.size() < boxCapacity)
		{
			balls.add(b);
			capacity+=b.capacity;
		}

	}
	
	public LinkedList<Ball> getBallsFromSmallest()
	{
		LinkedList<Ball> fromSmallest = new LinkedList<Ball>( (Collection<? extends Ball>) this);
		Collections.sort(fromSmallest, new Comparator<Ball>()
		{
			public int compare(Ball p1, Ball p2)
			{
				return Double.compare(p1.capacity, p2.capacity);
			}
		});
		return fromSmallest;
	}
	
	
	

}
