
public class Main {

	public static void main(String[] args) {
		
		AbsoluteEvaluatorFactory aef = new AbsoluteEvaluatorFactory();
		DirectEvaluatorFactory def = new DirectEvaluatorFactory();
		
		SumEvaluator s = new SumEvaluator();
		s.add(2);
		s.add(3);
		System.out.println(s.evaluate());
		
		PowerOnEvaluator poe1 = new PowerOnEvaluator();
		poe1.add(2);
		poe1.add(3);
		System.out.println(poe1.evaluate());
		
		PowerOnEvaluator poe2 = new PowerOnEvaluator(3);
		poe2.add(2);
		poe2.add(3);
		System.out.println(poe2.evaluate());
		
		FibonacciEvaluator fe = new FibonacciEvaluator();
		fe.add(2);
		fe.add(3);
		System.out.println(fe.evaluate());
		
		s = (SumEvaluator) aef.createSumEvaluator();
		s.add(-2);
		s.add(3);
		System.out.println(s.evaluate());
		
		poe1 = (PowerOnEvaluator) aef.createPowerOnEvaluator();
		poe1.add(-2);
		poe1.add(3);
		System.out.println(poe1.evaluate());
		
		poe2 = (PowerOnEvaluator) aef.createPowerOnEvaluator(3);
		poe2.add(-2);
		poe2.add(3);
		System.out.println(poe2.evaluate());
		
		fe = (FibonacciEvaluator) aef.createFibonacciEvaluator();
		fe.add(-2);
		fe.add(3);
		
		s = (SumEvaluator) def.createSumEvaluator();
		s.add(-2);
		s.add(3);
		System.out.println(s.evaluate());
		
		poe1 = (PowerOnEvaluator) def.createPowerOnEvaluator();
		poe1.add(-2);
		poe1.add(3);
		System.out.println(poe1.evaluate());
		
		poe2 = (PowerOnEvaluator) def.createPowerOnEvaluator(3);
		poe2.add(-2);
		poe2.add(3);
		System.out.println(poe2.evaluate());
		
		fe = (FibonacciEvaluator) def.createFibonacciEvaluator();
		fe.add(-2);
		fe.add(3);
		System.out.println(fe.evaluate());
	}
}
