package homework;

public class SumEvaluator implements IEvaluator {
	private double summed;
	
	public SumEvaluator() {
		summed=0.0;
	}

	@Override
	public void add(double d) {
		summed+=d;
	}

	@Override
	public double evaluate() {
		return summed;
	}
}