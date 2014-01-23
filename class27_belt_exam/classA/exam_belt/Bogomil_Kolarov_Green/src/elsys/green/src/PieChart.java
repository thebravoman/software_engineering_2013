package elsys.green.src;

public class PieChart extends Chart implements BogomilKolarov1 {
	
	
	
	public PieChart(int value1, int value2) {
		super(value1, value2);
	}

	@Override
	public void bogomil() {
		value2 *= value1;
		
	}

}
