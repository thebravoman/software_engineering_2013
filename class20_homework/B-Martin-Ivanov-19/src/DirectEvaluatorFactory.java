
public class DirectEvaluatorFactory implements IEvaluatorFactory {

	@Override
	public IEvaluator createSumEvaluator() {
		return new SumEvaluator();
	}

	@Override
	public IEvaluator createPowerOnEvaluator() {
		return new PowerOnEvaluator();
	}

	@Override
	public IEvaluator createPowerOnEvaluator(double power) {
		return new PowerOnEvaluator(power);
	}

	@Override
	public IEvaluator createFibonaciEvaluator() {
		return new FibonaciEvaluator();
	}

}
