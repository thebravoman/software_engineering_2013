package org.elsys.hw20;

public class AbsoluteEvaluatorFactory implements IEvaluatorFactory {
	
	@Override
	public IEvaluator createSumEvaluator() {
		return new SumEvaluator(true);
	}

	@Override
	public IEvaluator createPowerOnEvaluator() {
		return new PowerOnEvaluator(2, true);
	}

	@Override
	public IEvaluator createPowerOnEvaluator(double power) {
		return new PowerOnEvaluator(power, true);
	}

	@Override
	public IEvaluator createFibonacciEvaluator() {
		return new FibonacciEvaluator(true);
	}
}
