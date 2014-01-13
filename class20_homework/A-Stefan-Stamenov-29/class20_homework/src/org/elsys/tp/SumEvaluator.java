package org.elsys.tp;

public class SumEvaluator implements IEvaluator {

	private double sum;

	public SumEvaluator(){
		sum=0.0;
	}
	
	public void add(double d){
		sum+=d;
		
	}
	
	public double evaluate(){
		
		return this.sum;
	}
	

}
