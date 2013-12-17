package hw20;

public class PowerOnEvaluator implements IEvaluator {
	private double powered;
	private double power;
	
	public PowerOnEvaluator() {
		this.powered=0.0;
		this.power=2.0;
	}
	
	public PowerOnEvaluator(double power) {
		this.power=power;
	}
	
	@Override
	public void add(double d) {
		double power=d;
		for(int i=1;i<this.power;i++) {
			power*=d;
		}
		this.powered+=power;
	}

	@Override
	public double evaluate() {
		return this.powered;
	}
}
