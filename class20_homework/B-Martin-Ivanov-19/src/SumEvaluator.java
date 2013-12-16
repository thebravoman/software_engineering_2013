
public class SumEvaluator implements IEvaluator {
	private double currentSum;
	
	public SumEvaluator() {
		this.currentSum = 0.0;
	}
	@Override
	public void add(double d) {
		this.currentSum += d;
	}

	@Override
	public Double evaluate() {
		return this.currentSum;
	}

}
