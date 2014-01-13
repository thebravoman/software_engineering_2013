package org.elsys.se.class20.homework;

public class DirectEvaluatorFactory implements IEvaluatorFactory {

	@Override
	public IEvaluator createSumEvaluator() {
		return new SumEvaluator();
	}

	@Override
	public IEvaluator createPowerOnEvaluator() {
		return new PowerOnEvaluator(2.0);
	}

	@Override
	public IEvaluator createPowerOnEvaluator(double power) {
		return new PowerOnEvaluator(power);
	}

	@Override
	public IEvaluator createFibonacciEvaluator() {
		return new FibonacciEvaluator();
	}

}
