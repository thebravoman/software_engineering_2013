package org.elsys;

public class PieChart extends Chart implements MartinIvanov4{

	
	
	PieChart(int value1, int value2, int value3) {
		super(value1, value2, value3);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void martin() {
		this.value2 -= value1;
	}

}