package org.elsys.se.class20.homework;
import java.util.*;

public class SumEvaluator implements IEvaluator {
	
	private double evaluated;
	
	public SumEvaluator() {
		evaluated = 0.0;
	}
	@Override
	public void add(double d) {
		evaluated += d;
	}

	@Override
	public Double evaluate() {
		return evaluated;
	}

}
