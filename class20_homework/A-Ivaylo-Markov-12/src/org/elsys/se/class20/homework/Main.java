package org.elsys.se.class20.homework;

public class Main {

	public static void main(String[] args) {
		AbsoluteEvaluatorFactory aef = new AbsoluteEvaluatorFactory();
		IEvaluator sum = aef.createFibonacciEvaluator();
		sum.add(100);
		sum.add(1);
		sum.add(30);
		System.out.println(sum.evaluate());
	}

}
