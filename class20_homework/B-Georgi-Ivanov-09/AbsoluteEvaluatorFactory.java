package Homework3;

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
	
	// MAIN
	public static void main(String[] args) {
		AbsoluteEvaluatorFactory absolute = new AbsoluteEvaluatorFactory();
		
		SumEvaluator sum = (SumEvaluator) absolute.createSumEvaluator();
		sum.add(-2);
		sum.add(3);
		sum.add(-5);
		System.out.println("Sum = " + sum.evaluate());
		
		PowerOnEvaluator powerOn = (PowerOnEvaluator) absolute.createPowerOnEvaluator();
		powerOn.add(-5);
		powerOn.add(-3);
		powerOn.add(1);
		System.out.println("Power on 2 = " + powerOn.evaluate());
		
		PowerOnEvaluator powerOn2 = (PowerOnEvaluator) absolute.createPowerOnEvaluator(10.0);
		powerOn2.add(-2);
		powerOn2.add(2);
		System.out.println("Power on other = " + powerOn2.evaluate());
		
		FibonaciEvaluator fib = (FibonaciEvaluator) absolute.createFibonaciEvaluator();
		fib.add(-10);
        fib.add(20);
        System.out.println("Fibonacci = " + fib.evaluate());
	}
}
