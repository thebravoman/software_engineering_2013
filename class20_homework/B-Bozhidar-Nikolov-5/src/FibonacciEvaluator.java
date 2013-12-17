
public class FibonacciEvaluator implements IEvaluator {

	private double sum;
	
	public void add(double d) {
		this.sum += d;
	}

	public double evaluate() {
		double firstFibonacci = 1;
		double secondFibonacci = 1;
		double thirdFibonacci = 1;
		
		while(thirdFibonacci < this.sum){
			thirdFibonacci = firstFibonacci + secondFibonacci;
			firstFibonacci = secondFibonacci;
			secondFibonacci = thirdFibonacci;
		}
		
		if(this.sum - firstFibonacci < thirdFibonacci - this.sum) {
			return firstFibonacci;
		} else {
			return thirdFibonacci;
		}
	}

}
