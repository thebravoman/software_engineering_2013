package Homework3;

public class PowerOnEvaluator implements IEvaluator {
	private double sum;
	private double power;
	
	public PowerOnEvaluator(){
		this.sum = 0.0;
		this.power = 2;
	}
	
	public PowerOnEvaluator(double power){
		this.sum = 0;
		this.power = power;
	}
	
	@Override
	public void add(double d) {
		this.sum += Math.pow(d, power);
	}

	@Override
	public double evaluate() {
		return sum;
	}

}
