
public class DirectEvaluatorFactory implements IEvaluatorFactory{

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
	
	public static void main(String[] args) {
		IEvaluatorFactory e = new DirectEvaluatorFactory();
		SumEvaluator s = (SumEvaluator) e.createSumEvaluator();
		s.add(-5);
		s.add(-2);
		s.add(-6);
		System.out.println(s.evaluate());
		PowerOnEvaluator p = (PowerOnEvaluator) e.createPowerOnEvaluator();
		p.add(2);
		p.add(4);
		p.add(3);
		System.out.println(p.evaluate());
		PowerOnEvaluator p2 = (PowerOnEvaluator) e.createPowerOnEvaluator(3.0);
		p2.add(2);
		p2.add(4);
		p2.add(3);
		System.out.println(p2.evaluate());
		FibonaciEvaluator f = (FibonaciEvaluator) e.createFibonaciEvaluator();
		f.add(-10);
		f.add(194);
		System.out.println(f.evaluate());
		
	}
}
