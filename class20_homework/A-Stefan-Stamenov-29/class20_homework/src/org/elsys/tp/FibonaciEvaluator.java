package org.elsys.tp;

public class FibonaciEvaluator implements IEvaluator {

	private double sum;
	
	
	public FibonaciEvaluator(){
		
		this.sum=0.0;
	}
		
	
	@Override
	public void add(double d) {
		this.sum+=d;
	}

	@Override
	public double evaluate() {
		double theFnum=1.0;
		while (fib(theFnum)<sum){
			theFnum+=1;
		}
		if ((fib(theFnum)-sum)<(sum-fib(theFnum-1))){
				return fib(theFnum);
		}else{
		return fib(theFnum-1);
		}
	}

	
	private double fib(double f) {
        if (f < 2) {
           return f;
        }
        else {
        	return fib(f-1)+fib(f-2);
        }
}
}