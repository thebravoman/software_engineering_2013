package org.elsys.homework;

public class AbsoluteEvaluatorFactory implements IEvaluatorFactory {

	@Override
	public IEvaluator createSumEvaluator() {
		return new SumEvaluator(){
			public void add(double d){
				super.add(Math.abs(d));
			}
		};
	}

	@Override
	public IEvaluator createPowerOnEvaluator() {
		return new PowerOnEvaluator(2.0){
			public void add(double d){
				super.add(Math.abs(d));
			}
		};
	}

	@Override
	public IEvaluator createPowerOnEvaluator(double power) {
		return new PowerOnEvaluator(power){
			public void add(double d){
				super.add(Math.abs(d));
			}
		};
	}

	@Override
	public IEvaluator createFibonaciEvaluator() {
		return new FibonaciEvaluator(){
			public void add(double d){
				super.add(Math.abs(d));
			}
		};
	}

}
