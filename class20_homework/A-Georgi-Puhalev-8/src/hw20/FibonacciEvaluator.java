package hw20;

public class FibonacciEvaluator implements IEvaluator {
	
	private double sum;
	private double[] twoNumbers = new double[2];
	
	public void add(double d) {
		this.sum+=d;
	}
	
	public FibonacciEvaluator() {
			this.sum = 0.0;
	}
	
	public double evaluate(){
		double[] theNumbers = CalcFibNum(sum);
		double toreturn;
		if ((theNumbers[0]-sum) > (sum - theNumbers[1])){
			toreturn = theNumbers[1];
		}else{
			toreturn= theNumbers[0];
		}
		
		return toreturn;
	}
		
	
	private double[] CalcFibNum(double num){
		
		int prevVal = 1;
		int befPrevVal = 0;
		int curVal;
		
		while(1<5){
			curVal = befPrevVal + prevVal;
			befPrevVal = prevVal;
			
			if(curVal > num){
				twoNumbers[0] = curVal;
				twoNumbers[1] = prevVal;
				break;
			}
			prevVal = curVal;		
		}
		
		return twoNumbers;
	}
	
	
}
