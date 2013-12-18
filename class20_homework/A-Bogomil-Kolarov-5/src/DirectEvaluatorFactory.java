
public class DirectEvaluatorFactory implements IEvaluatorFactory {

	public IEvaluator createSumEvaluator() {
		IEvaluator evaluator = new SumEvaluator();
		return evaluator;
	}

	public IEvaluator createPowerOnEvaluator() {
		IEvaluator evaluator = new PowerOnEvaluator();
		return evaluator;
	}

	@Override
	public IEvaluator createPowerOnEvaluator(double power) {
		IEvaluator evaluator = new PowerOnEvaluator(power);
		return evaluator;	
	}

	@Override
	public IEvaluator createFibonaciEvaluator() {
		IEvaluator evaluator = new FibonaciEvaluator();
		return evaluator;
	}
	
}
