
public class Chart {
	private int value1;
	private int value2;
	
	Chart(int val1,int val2){
		value1 = val1;
		value2 = val2;
	}
	protected int getValue1() {
		return value1;
	}
	protected int getValue2() {
		return value2;
	}
	protected void setValue2(int value2) {
		this.value2 = value2;
	}
}
