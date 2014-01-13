
public class AbsoluteEvaluatorFactory implements IEvaluatorFactory {
	
	public IEvaluator createSumEvaluator() {
		//overrides SumEvaluator.add
		return new SumEvaluator() {
			public void add(double d) {
				super.add(Math.abs(d));
			}
		};
	}

	public IEvaluator createPowerOnEvaluator() {
		//overrides PowerOnEvaluator.add
		return new PowerOnEvaluator() {
			public void add(double d) {
				super.add(Math.abs(d));
			}
		};
	}

	public IEvaluator createPowerOnEvaluator(double power) {
		//overrides PowerOnEvaluator.add
		return new PowerOnEvaluator(power) {
			public void add(double d) {
				super.add(Math.abs(d));
			}
		};
	}

	public IEvaluator createFibonacciEvaluator() {
		//overrides FibonacciEvaluator.add
		return new FibonacciEvaluator() {
			public void add(double d) {
				super.add(Math.abs(d));
			}
		};
	}
}
