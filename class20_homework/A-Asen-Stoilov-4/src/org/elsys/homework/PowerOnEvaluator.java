package org.elsys.homework;

public class PowerOnEvaluator implements IEvaluator {
	private double sum;
	private double power;
	
	public PowerOnEvaluator(double p) {
		this.sum = 0;
		this.power = p;
	}
	@Override
	
	public void add(double d) {
		this.sum += Math.pow(d,this.power);
	}


	@Override
	public Double evaluate() {
		return this.sum;
	}

}
