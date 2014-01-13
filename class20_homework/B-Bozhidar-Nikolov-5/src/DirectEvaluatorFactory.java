
public class DirectEvaluatorFactory implements IEvaluatorFactory{

	public IEvaluator createSumEvaluator() {
		return new SumEvaluator();
	}

	public IEvaluator createPowerOnEvaluator() {
		return new PowerOnEvaluator();
	}

	public IEvaluator createPowerOnEvaluator(double power) {
		return new PowerOnEvaluator(power);
	}

	public IEvaluator createFibonacciEvaluator() {
		return new FibonacciEvaluator();
	}

}
