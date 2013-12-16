package hw20;

public class PowerOnEvaluator  implements IEvaluator {

	private double sum;
	private double power;
	
	public PowerOnEvaluator(){
		this.sum = 0.0;
		this.power = 2.0;
	}
	
	public PowerOnEvaluator(double power){
		this.sum=0.0;
		this.power = power;
	}
	
	public void add(double d) {
		this.sum += Math.pow(d, power);
	}
	public double evaluate() {
		return this.sum;
	}
	
}
