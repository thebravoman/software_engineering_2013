
public class SumEvaluator implements IEvaluator {
	private double sum = 0;
	
	public SumEvaluator() {
		this.sum = 0.0;
	}
	
	public void add(double d) {
		this.sum = this.sum + d;
	}

	public Double evaluate() {
		return this.sum;
	}
	
}
