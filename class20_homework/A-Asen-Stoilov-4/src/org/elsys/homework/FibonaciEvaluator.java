package org.elsys.homework;

public class FibonaciEvaluator implements IEvaluator {
	private double num;
	@Override
	public void add(double d) {
		this.num = d;
	}

	@Override
	public Double evaluate() {
		double  nextnum=1.0; 
		double prevnum = 1.0;
		double num2;
		do{
			num2 = nextnum;
			nextnum = nextnum + prevnum;
			prevnum = num2;
		}while(nextnum < this.num);
		
		if (nextnum-this.num > this.num - prevnum )
			return prevnum;
		return nextnum;
	}

}
