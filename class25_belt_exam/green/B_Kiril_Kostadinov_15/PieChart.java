
public class PieChart extends Chart implements KirilKostadinov2 {
	PieChart(int v1, int v2, int v3) {
		super(v1, v2, v3);
	}
	
	@Override
	public void kiril() {
		setB(getB() - getA());
	}

}
