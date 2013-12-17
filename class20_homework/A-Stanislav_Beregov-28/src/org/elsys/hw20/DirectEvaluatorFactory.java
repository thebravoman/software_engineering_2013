package org.elsys.hw20;

public class DirectEvaluatorFactory implements IEvaluatorFactory {
	
	@Override
	public IEvaluator createSumEvaluator() {
		return new SumEvaluator(false);
	}

	@Override
	public IEvaluator createPowerOnEvaluator() {
		return new PowerOnEvaluator(2, false);
	}

	@Override
	public IEvaluator createPowerOnEvaluator(double power) {
		return new PowerOnEvaluator(power, false);
	}

	@Override
	public IEvaluator createFibonacciEvaluator() {
		return new FibonacciEvaluator(false);
	}
}
