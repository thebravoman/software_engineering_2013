
public class BarChart extends Chart implements AsenStoilov4{

	BarChart(int val1, int val2) {
		super(val1, val2);
	}

	@Override
	public void asen() {
		super.setValue2(super.getValue1()*2);
		
	}

}
