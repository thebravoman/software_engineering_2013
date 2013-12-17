
public class PowerOnEvaluator implements IEvaluator {

	private double currentSum;
	private double power;
	
	public PowerOnEvaluator() {
		this.currentSum = 0.0;
		this.power = 2.0;
	}
	
	public PowerOnEvaluator(double p){
		this.currentSum = 0.0;
		this.power = p ;
	}
	
	@Override
	public void add(double d) {
		this.currentSum += (Math.pow(d, this.power));
	}

	@Override
	public Double evaluate() {
		return this.currentSum;
	}

}
