package Homework3;

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
	
	// MAIN
	public static void main(String[] args) {
		DirectEvaluatorFactory direct = new DirectEvaluatorFactory();
		
		SumEvaluator sum = (SumEvaluator) direct.createSumEvaluator();
		sum.add(-2);
		sum.add(3);
		sum.add(-5);
		System.out.println("Sum = " + sum.evaluate());
		
		PowerOnEvaluator powerOn = (PowerOnEvaluator) direct.createPowerOnEvaluator();
		powerOn.add(-5);
		powerOn.add(-3);
		powerOn.add(1);
		System.out.println("Power on 2 = " + powerOn.evaluate());
		
		PowerOnEvaluator powerOn2 = (PowerOnEvaluator) direct.createPowerOnEvaluator(10.0);
		powerOn2.add(-2);
		powerOn2.add(2);
		System.out.println("Power on other = " + powerOn2.evaluate());
		
		FibonaciEvaluator fib = (FibonaciEvaluator) direct.createFibonaciEvaluator();
		fib.add(-10);
        fib.add(20);
        System.out.println("Fibonacci = " + fib.evaluate());
		
	}
}
