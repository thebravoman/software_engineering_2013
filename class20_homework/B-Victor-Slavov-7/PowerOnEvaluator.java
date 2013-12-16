public class PowerOnEvaluator implements IEvaluator 
{
	private double evaluated;
	private double power;

	public PowerOnEvaluator(double power) 
	{
		this.evaluated = 0.0;
		this.power = power;
	}

	public void add(double d) 
	{
		this.evaluated += Math.pow(d, power);
	}

	public double evaluate() 
	{
		return this.evaluated;
	}
}
