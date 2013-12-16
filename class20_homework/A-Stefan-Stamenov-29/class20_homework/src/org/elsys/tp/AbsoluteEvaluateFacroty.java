package org.elsys.tp;

public class AbsoluteEvaluateFacroty implements IEvaluatorFactory {

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
		return new PowerOnEvaluator(){
			public void add(double d){
				super.add(Math.abs(d));
			}
		};
	}

	@Override
	public IEvaluator createPowerOnEvaluator(double power) {
		return new PowerOnEvaluator(power){
			public void add(double d){
				super.add(Math.abs(d));
			}
		};
	}

	@Override
	public IEvaluator createFibonaciEvaluator() {
		return new FibonaciEvaluator(){
			public void add(double d){
				super.add(Math.abs(d));
			}
		};
		
	}
	
	 public static void main(String[] args) {
		 DirectEvaluateFactory d = new DirectEvaluateFactory();
         SumEvaluator s = (SumEvaluator) d.createSumEvaluator();
         s.add(-5);
         s.add(15);
         System.out.println(s.evaluate());
         PowerOnEvaluator p = (PowerOnEvaluator) d.createPowerOnEvaluator();
         p.add(2);
         p.add(-2);
         System.out.println(p.evaluate());
         PowerOnEvaluator p2 = (PowerOnEvaluator) d.createPowerOnEvaluator(-3);
         p2.add(2);
         p2.add(3);
         System.out.println(p2.evaluate());
         FibonaciEvaluator f = (FibonaciEvaluator) d.createFibonaciEvaluator();
         f.add(100);
         f.add(30);
         f.add(1);
         System.out.println(f.evaluate());
	 }
}