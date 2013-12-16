
public class PowerOnEvaluator implements IEvaluator {
	private double sum = 0.0;
	private double power;
	
	public PowerOnEvaluator() {
		this.power = 2.0;
	}
	
	public PowerOnEvaluator(double power) {
		this.power = power;
	}
	
	@Override
	public void add(double d) {
		sum += Math.pow( d, power) ;
	}

	@Override
	public Double evaluate() {
		return this.sum;
	}

}
