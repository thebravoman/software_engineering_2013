package org.elsys.tp;

public class PowerOnEvaluator implements IEvaluator {

	private double num;
	private double exponent;
	
	
	public PowerOnEvaluator(){
		this.num=0.0;
		this.exponent=2.0;
	}
	
	public PowerOnEvaluator(double exponent){
		this.num=0.0;
		this.exponent=exponent;
	}
	

	@Override
	public void add(double d) {
		this.num+=Math.pow(d, exponent);
	}
	@Override
	public double evaluate() {
		return this.num;
	}
}
