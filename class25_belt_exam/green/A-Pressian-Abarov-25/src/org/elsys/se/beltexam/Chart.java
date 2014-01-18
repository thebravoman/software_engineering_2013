package org.elsys.se.beltexam;

public class Chart {
	private int value1;
	private int value2;
	private int value3;


	Chart(int value1, int value2, int value3) {
		this.value1 = value1;
		this.value2 = value2;
		this.value3 = value3;
	}

	public int getValue1() {
		return value1;
	}
	public int getValue2() {
		return value2;
	}
	public void setValue2(int value2) {
		this.value2 = value2;
	}
	public int getValue3() {
		return value3;
	}

	public void print() {
		System.out.println(this.getValue1());
		System.out.println(this.getValue2());
		System.out.println(this.getValue3());
	}
}
