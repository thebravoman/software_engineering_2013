package Homework3;

public class SumEvaluator implements IEvaluator {
	private double sum;
	
	public SumEvaluator(){
		this.sum = 0.0;
	}
	
	@Override
	public void add(double d) {
		this.sum += d;
	}

	@Override
	public double evaluate() {
		return this.sum;
	}

}
