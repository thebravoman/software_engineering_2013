public class AbsoluteEvaluatorFactory implements IEvaluatorFactory 
{
	public IEvaluator createSumEvaluator() 
	{
		return new SumEvaluator() 
		{
			public void add(double d) 
			{
				super.add(Math.abs(d));
			}
		};
	}

	public IEvaluator createPowerOnEvaluator() 
	{
		return this.createPowerOnEvaluator(2.0);
	}

	public IEvaluator createPowerOnEvaluator(double power) 
	{
		return new PowerOnEvaluator(power) 
		{
			public void add(double d) 
			{
				super.add(Math.abs(d));
			}
		};
	}

	public IEvaluator createFibonacciEvaluator() 
	{
		return new FibonacciEvaluator() 
		{
			public void add(double d) 
			{
				super.add(Math.abs(d));
			}
		};
	}
}
