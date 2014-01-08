package hw20;

public class AbsoluteEvaluatorFactory implements IEvaluatorFactory {
    
    @Override
    public IEvaluator createSumEvaluator() {
            return new SumEvaluator(true);
    }

    @Override
    public IEvaluator createPowerOnEvaluator() {
            return new PowerOnEvaluator(2, true);
    }

    @Override
    public IEvaluator createPowerOnEvaluator(double power) {
            return new PowerOnEvaluator(power, true);
    }

    @Override
    public IEvaluator createFibonacciEvaluator() {
            return new FibonacciEvaluator(true);
    }
    
    public static void main(String[] args) {
    	
    	  DirectEvaluatorFactory d = new DirectEvaluatorFactory();
          SumEvaluator s = (SumEvaluator) d.createSumEvaluator();
          s.add(5);
          s.add(-4);
          System.out.println(s.evaluate());
          
          /////////////////////////////////////////////////////////////////
          PowerOnEvaluator p = (PowerOnEvaluator) d.createPowerOnEvaluator();
          p.add(-5);
          p.add(-4);
          System.out.println(p.evaluate());
          
          /////////////////////////////////////////////////////////////////
          PowerOnEvaluator p2 = (PowerOnEvaluator) d.createPowerOnEvaluator(3);
          p2.add(-5);
          p2.add(4);
          System.out.println(p2.evaluate());
          
          /////////////////////////////////////////////////////////////////
          FibonacciEvaluator f = (FibonacciEvaluator) d.createFibonacciEvaluator();
          f.add(5);
          f.add(-4);
          System.out.println(f.evaluate());
}
}