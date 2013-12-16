
public class FibonaciEvaluator implements IEvaluator {

	private double curSum;
	
	public FibonaciEvaluator() {
		this.curSum = 0.0;
	}
	
	@Override
	public void add(double d) {
		this.curSum += d;
	}

	@Override
	public Double evaluate() {
		double curFibonaci = 1.0;
		double prevFibonaci = 1.0;
		
		while(curFibonaci < curSum ){
			curFibonaci += prevFibonaci;
		}
		
		if ((curFibonaci - this.curSum)<(this.curSum - prevFibonaci))
			return curFibonaci;
		else 
			return prevFibonaci;
	}

}
