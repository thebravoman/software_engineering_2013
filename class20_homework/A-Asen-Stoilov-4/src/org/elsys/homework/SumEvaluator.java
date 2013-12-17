package org.elsys.homework;

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
	public Double evaluate() {
		return this.sum;
	}

}
