
public class PowerOnEvaluator implements IEvaluator {
	double sum;
	double pow;
	
	public PowerOnEvaluator(double power) {
		this.sum = 0.0;
		this.pow = power;
	}
	
	public void add(double d) {
		this.sum += (Math.pow(d, this.pow));
	}

	public double evaluate() {
		return this.sum;
	}

}
