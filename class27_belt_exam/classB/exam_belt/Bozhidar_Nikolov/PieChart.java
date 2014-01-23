
public class PieChart extends Chart implements BozhidarNikolov3 {

	PieChart(int v1, int v2, int v3) {
		value1 = v1;
		value2 = v2;
		value3 = v3;
	}

	public void bozhidar() {
		value2 -= value1;
	}

}
