
public class SumEvaluator implements IEvaluator{

	private double sum;

	public void add(double d) {
		this.sum += d;
	}

	public double evaluate() {
		return this.sum;
	}
	
	
}
