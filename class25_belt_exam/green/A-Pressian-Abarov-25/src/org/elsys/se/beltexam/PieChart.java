package org.elsys.se.beltexam;

public class PieChart extends Chart implements PressianAbarov2 {

	PieChart(int value1, int value2, int value3) {
			super(value1, value2, value3);
	}

	public void presian() {
		this.setValue2(this.getValue2() - this.getValue1());
	}
}
