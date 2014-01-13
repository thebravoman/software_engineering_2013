package org.elsys.se.class20.homework;

public class PowerOnEvaluator implements IEvaluator {
	
	private double evaluated;
	private double power;
	
	public PowerOnEvaluator(double setPower) {
		power = setPower;
		evaluated = 0.0;
	}
	@Override
	public void add(double d) {
		evaluated += Math.pow(d,power);
	}

	@Override
	public Double evaluate() {
		return evaluated;
	}
}
