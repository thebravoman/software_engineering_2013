import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.LinkedList;

public class Box extends BallContainer
{
	protected final double maxCapacity;

	public Box(double maxCapacity)
	{
		super();
		this.maxCapacity = maxCapacity;
	}

	public boolean add(Ball ball)
	{
		if(this.capacity + ball.capacity > this.maxCapacity)
			return false;

		return super.add(ball);
	}

	public List<Ball> getBallsFromSmallest()
	{
		List<Ball> sorted = new LinkedList<Ball>(this);
		Collections.sort(sorted, new Comparator<Ball>()
		{
			@Override
			public int compare(Ball a, Ball b)
			{
				return Double.compare(a.capacity, b.capacity);
			}
		});

		return Collections.unmodifiableList(sorted);
	}
}
