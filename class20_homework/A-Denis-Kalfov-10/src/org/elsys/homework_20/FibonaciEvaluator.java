package org.elsys.homework_20;

public class FibonaciEvaluator implements IEvaluator{
	
	double sum;
	
	double f1=1.0;
	double f2=1.0;
	double f4=0.0;
	
	double fc=0.0;
	double fc_2=0.0;

	
	@Override
	public void add(double d) {
		this.sum+=d;
		
		for (;f2<sum;){
			f4=f1+f2;	
			f1=f2;
			f2=f4;			
		}	
		
		if ((Math.abs(sum-f2))<(Math.abs(sum-f1))){
			fc=f2;
		}else {
			fc=f1;
		}
		
		if ((Math.abs(sum-f2))==(Math.abs(sum-f1))){
			fc_2=f2;
		}
			
	}
	
		
	@Override
	public Double evaluate() {
		if (fc_2==0){
			return this.fc;
		} else {
			System.out.println(fc);
            return this.fc_2;
		}
	}
		
		
				
	 public static void main(String[] args) {
         DirectEvaluatorFactory direct = new DirectEvaluatorFactory();
                  
         FibonaciEvaluator eval_fibo = (FibonaciEvaluator) direct.createFibonaciEvaluator();
         eval_fibo.add(100);
         eval_fibo.add(30);
         eval_fibo.add(1);
         System.out.println(eval_fibo.evaluate());
	 }

}
