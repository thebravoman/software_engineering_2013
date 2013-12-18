
public class FibonacciEvaluator implements IEvaluator {
	double sum;
	
	public FibonacciEvaluator() {
		this.sum = 0.0;
	}
	
	@Override
	public void add(double d) {
		this.sum += d;
	}

	@Override
	public double evaluate() {
		double prev = 1.0;
		double next = 1.0;
		double temp = 0.0;
		while(sum > next) {
			temp = next;
			next += prev;
			prev = temp;
		}
		if ((next - this.sum) < (this.sum - prev)) {
			return next;
		} else {
			return prev;
		}
	}

}