
public class PowerOnEvaluator implements IEvaluator {
	
	private double power;
	private double sum;
	
	public PowerOnEvaluator() {
		this.power = 2;
	}

	public PowerOnEvaluator(double p) {
		this.power = p;
	}
	
	public void add(double d) {
		this.sum += (Math.pow(d, this.power));
	}

	public double evaluate() {
		return this.sum;
	}

}
