package org.elsys.hw20;

public class PowerOnEvaluator implements IEvaluator {
	double sum = 0;
	double power;
	private boolean abs;
	public PowerOnEvaluator(double pow, boolean abs){
		this.abs = abs;
		power = pow;
	}
	public void add(double d){
		if(abs)sum += Math.pow(Math.abs(d), power);
		else sum += Math.pow(d, power);
	}
	public Double evaluate(){
		return sum;
	}
}
