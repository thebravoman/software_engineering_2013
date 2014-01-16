package org.elsys.se.beltexam;

public class Chart implements PressianAbarov2 {
	public int value1;
	public int value2;
	public int value3;


	Chart(int value1, int value2, int value3){
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
	public int getValue3() {
		return value3;
	}
}
