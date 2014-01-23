package green;

public class PieChart extends Chart implements AntonGeorgiev2 {

	public PieChart(int value1, int value2, int value3) {
		this.value1=value1;
		this.value2=value2;
		this.value3=value3;
	}
	
	@Override
	public void anton() {
		value2-=value1;
	}

}