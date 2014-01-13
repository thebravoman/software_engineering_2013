
public class PowerOnEvaluator implements IEvaluator {
	private double power;
	private double powered;
	
	public PowerOnEvaluator(){
		this.power = 2.0;
	}
	
	public PowerOnEvaluator(double power) {
		this.power = power;
	}

	@Override
	public void add(double d) {
		double temp = d;
		for (int i = 1;i<this.power;i++){
			temp *= d;
		}
		this.powered += temp;
	}

	@Override
	public double evaluate() {
		return this.powered;
	}

}
