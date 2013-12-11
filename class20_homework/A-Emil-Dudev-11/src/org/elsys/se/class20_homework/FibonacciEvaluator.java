package org.elsys.se.class20_homework;

import java.util.ArrayList;

public class FibonacciEvaluator implements IEvaluator {
	private double evaluated;
	private ArrayList<Long> fibonacciNumbers;

	private long nextFibonacciNumber() {
		long first = this.fibonacciNumbers.get(this.fibonacciNumbers.size()-2);
		long second = this.fibonacciNumbers.get(this.fibonacciNumbers.size()-1);
		this.fibonacciNumbers.add(first + second);
		return this.fibonacciNumbers.get(this.fibonacciNumbers.size()-1);
	}

	public FibonacciEvaluator() {
		this.evaluated = 0.0;
		this.fibonacciNumbers = new ArrayList<Long>();

		this.fibonacciNumbers.add(0L);
		this.fibonacciNumbers.add(1L);
	}

	public void add(double d) {
		this.evaluated += d;
	}

	public double evaluate() {
		if( this.evaluated < 0.0 )
			throw new ArithmeticException();

		long number = (long)this.evaluated;
		long next = this.fibonacciNumbers.get(this.fibonacciNumbers.size()-1);
		while( next < number )
			next = this.nextFibonacciNumber();

		long prev = this.fibonacciNumbers.get(this.fibonacciNumbers.size()-2);
		if( number - prev < next - number )
			return prev;
		return next;
	}
}
