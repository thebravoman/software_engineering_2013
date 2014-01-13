
public class DirectEvaluatorFactory implements IEvaluatorFactory {

	@Override
	public IEvaluator createSumEvaluator() {
		return new SumEvaluator();
	}

	@Override
	public IEvaluator createPowerOnEvaluator() {
		return this.createPowerOnEvaluator(2.0);
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
