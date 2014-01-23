public class PieChart extends Chart implements MilkoFilipov3 {

	PieChart(int value1, int value2, int value3) {
			super(value1, value2, value3);
	}

	public void milko() {
		this.setValue2(this.getValue2() - this.getValue1());
	}
}

