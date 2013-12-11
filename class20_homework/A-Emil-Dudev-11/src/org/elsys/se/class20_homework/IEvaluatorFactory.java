package org.elsys.se.class20_homework;

public interface IEvaluatorFactory {

	public IEvaluator createSumEvaluator();

	public IEvaluator createPowerOnEvaluator();

	public IEvaluator createPowerOnEvaluator(double power);

	public IEvaluator createFibonacciEvaluator();

}

