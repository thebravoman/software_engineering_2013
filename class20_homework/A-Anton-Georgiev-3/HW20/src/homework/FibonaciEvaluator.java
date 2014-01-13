package homework;

public class FibonaciEvaluator implements IEvaluator {
	private double fibonaci;
	
	public FibonaciEvaluator() {
		this.fibonaci=0.0;
	}
	
	@Override
	public void add(double d) {
		this.fibonaci+=d;
	}

	@Override
	public double evaluate() {
		double fibo=1.0;
		while(fibonaciNumbers(fibo)<fibonaci) {
			fibo++;
		}
		if(fibonaciNumbers(fibo)-fibonaci<fibonaci-fibonaciNumbers(fibo-1)) {
			return fibonaciNumbers(fibo);
		}else {
			return fibonaciNumbers(fibo-1);
		}
	}
	
	private double fibonaciNumbers(double fibo) {
		double fibonaci=0.0;
		if(fibo==1.0 || fibo==2.0) {
			fibonaci=1.0;
		}
		else if(fibo>2.0) {
			fibonaci=fibonaciNumbers(fibo-1)+fibonaciNumbers(fibo-2);
		}
		return fibonaci;
	}
}