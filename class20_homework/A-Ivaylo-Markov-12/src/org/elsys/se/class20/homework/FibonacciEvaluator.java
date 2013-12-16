package org.elsys.se.class20.homework;

public class FibonacciEvaluator implements IEvaluator {
	
	private int[] fibonacciNumbers = new int[2];
	private int evaluated;
	
	public FibonacciEvaluator() {
		fibonacciNumbers[0] = 0;
		fibonacciNumbers[1] = 1;
		evaluated = 0;
		
	}
	
	@Override
	public void add(double d) {
		evaluated += d;

	}

	@Override
	public Double evaluate() {
		double fibonacci = 0.0;
		double previousFibonacci = 0.0;
		while(fibonacci < evaluated) {
			previousFibonacci = fibonacci;
			fibonacci = nextFibonacciNumber();
		}
		
		if((evaluated - fibonacci) < (evaluated - previousFibonacci)) {
			return fibonacci;
		}
		else {
			return previousFibonacci;
		}
	}
	
	private double nextFibonacciNumber() {
		int fib = fibonacciNumbers[0] + fibonacciNumbers[1];
		fibonacciNumbers[1] = fibonacciNumbers[0];
		fibonacciNumbers[0] = fib;
		return  fib;
	}

}
