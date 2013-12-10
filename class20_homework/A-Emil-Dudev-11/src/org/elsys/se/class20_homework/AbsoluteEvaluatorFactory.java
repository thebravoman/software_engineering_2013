package org.elsys.se.class20_homework;

public class AbsoluteEvaluatorFactory implements IEvaluatorFactory {

	public class AbsoluteSumEvaluator extends SumEvaluator {
		public void add(double d) {
			super.add(Math.abs(d));
		}
	}

	public class AbsolutePowerOnEvaluator extends PowerOnEvaluator {
		public AbsolutePowerOnEvaluator(double power) {
			super(power);
		}
		public void add(double d) {
			super.add(Math.abs(d));
		}
	}

	public class AbsoluteFibonacciEvaluator extends FibonacciEvaluator {
		public void add(double d) {
			super.add(Math.abs(d));
		}
	}

	public IEvaluator createSumEvaluator() {
		return new AbsoluteSumEvaluator();
	}

	public IEvaluator createPowerOnEvaluator() {
		return this.createPowerOnEvaluator(2.0);
	}

	public IEvaluator createPowerOnEvaluator(double power) {
		return new AbsolutePowerOnEvaluator(power);
	}

	public IEvaluator createFibonacciEvaluator() {
		return new AbsoluteFibonacciEvaluator();
	}
}
