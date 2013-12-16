package org.elsys.homework_20;

public class SumEvaluator implements IEvaluator{
	double sum;

	
	public SumEvaluator(){
		this.sum=0.0;
	}
	
	@Override
	public void add(double d) {
		this.sum+=d;
		
	}

	@Override
	public Double evaluate() {
		return this.sum;
	}
	
	
	
	public static void main(String[] args) {
		DirectEvaluatorFactory direct = new DirectEvaluatorFactory();
	
		SumEvaluator eval_sum = (SumEvaluator) direct.createSumEvaluator();
		eval_sum.add(3);
		eval_sum.add(4);
		eval_sum.add(5);
		System.out.println(eval_sum.evaluate());
	}
		
}