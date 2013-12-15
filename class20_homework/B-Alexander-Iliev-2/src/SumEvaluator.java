
public class SumEvaluator implements IEvaluator{
	private double sum;
	
	public SumEvaluator(){
		this.sum = 0.0;
	}
	@Override
	public void add(double d) {
		sum += d;
	}

	@Override
	public double evaluate() {
		return sum;
	}
	

}
