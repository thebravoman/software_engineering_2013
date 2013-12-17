package homework;

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
		return new PowerOnEvaluator() {
			public void add(double d) {
				super.add(Math.abs(d));
			}
		};
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

	public static void main(String[] args) {
		DirectEvaluatorFactory d = new DirectEvaluatorFactory();
		SumEvaluator s = (SumEvaluator) d.createSumEvaluator();
		s.add(5);
		s.add(-4);
		System.out.println(s.evaluate());
		PowerOnEvaluator p = (PowerOnEvaluator) d.createPowerOnEvaluator();
		p.add(-5);
		p.add(-4);
		System.out.println(p.evaluate());
		PowerOnEvaluator p2 = (PowerOnEvaluator) d.createPowerOnEvaluator(3);
		p2.add(-5);
		p2.add(4);
		System.out.println(p2.evaluate());
		FibonaciEvaluator f = (FibonaciEvaluator) d.createFibonaciEvaluator();
		f.add(5);
		f.add(-4);
		System.out.println(f.evaluate());
	}
}
