
public class SumEvaluator implements IEvaluator {
	private double curSum;
	
	public SumEvaluator() {
		this.curSum = 0.0;
	}
	@Override
	public void add(double d) {
		this.curSum += d;
	}

	@Override
	public Double evaluate() {
		return this.curSum;
	}

}
