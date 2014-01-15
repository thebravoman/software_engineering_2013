public class AbsoluteEvaluatorFactory implements IEvaluatorFactory {

	@Override
	public IEvaluator createSumEvaluator() {
		return new SumEvaluator() {
        		public void add(double d) {
        			super.add(Math.abs(d));
            		}
		};	
	}

	@Override
	public IEvaluator createPowerOnEvaluator() {
		IEvaluator evaluator = new PowerOnEvaluator();
		return evaluator;
	}

	@Override
	public IEvaluator createPowerOnEvaluator(double power) {
		return new PowerOnEvaluator(power) {
			public void add(double d) {
				super.add(Math.abs(d));
			}
		};
	}

	@Override
	public IEvaluator createFibonaciEvaluator() {
		return new FibonaciEvaluator() {
			public void add(double d) {
				super.add(Math.abs(d));
			}
		};
	}

}
