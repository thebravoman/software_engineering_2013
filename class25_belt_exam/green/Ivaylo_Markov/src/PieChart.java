
public class PieChart extends Chart implements IvayloMarkov4 {


	public PieChart(int value1, int value2, int value3) {
		super(value1, value2, value3);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void ivaylo() {
		this.value2 -= value1;

	}

}
