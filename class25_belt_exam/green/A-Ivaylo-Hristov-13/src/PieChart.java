
public class PieChart extends Chart implements IvayloHristov4 {

	public PieChart(int value1, int value2, int value3) {
		super(value1, value2, value3);
	}

	@Override
	public void ivaylo() {
		setValue2(getValue2() - getValue1());
	}

}
