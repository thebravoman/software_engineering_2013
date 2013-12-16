package org.elsys.homework_20;

public class PowerOnEvaluator implements IEvaluator{

	double power;
	double PoweredNum=0.0;
	

	public PowerOnEvaluator(){
		this.power=2.0;
	}
		
	public PowerOnEvaluator(double power){
		this.power=power;
	}
	
	
	@Override
	public void add(double d) {
		double power=d;
		
		for (int i=1;i<this.power;i++){
				d*=power;
		}
		
		this.PoweredNum+=d;
	}

	@Override
	public Double evaluate() {
		return this.PoweredNum;
	}
	
		
	public static void main(String[] args) {
		DirectEvaluatorFactory direct = new DirectEvaluatorFactory();
		
//		PowerOnEvaluator eval_power = (PowerOnEvaluator) direct.createPowerOnEvaluator();
		PowerOnEvaluator eval_power = (PowerOnEvaluator) direct.createPowerOnEvaluator(3);
		eval_power.add(3);
		eval_power.add(4);
		eval_power.add(5);
		System.out.println(eval_power.evaluate());
	}
	
}