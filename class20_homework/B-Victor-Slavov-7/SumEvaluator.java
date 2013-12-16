public class SumEvaluator implements IEvaluator
{
	private double evaluated;

	public SumEvaluator()
	{
		this.evaluated = 0.0;
	}

	public void add(double d)
	{
		this.evaluated += d;
	}

	public double evaluate()
	{
		return this.evaluated;
	}
}
