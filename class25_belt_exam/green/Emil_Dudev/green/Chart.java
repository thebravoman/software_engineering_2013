package green;

public abstract class Chart {
	protected int value1;
	protected int value2;
	protected int value3;

	public Chart( int v1, int v2, int v3 ) {
		value1 = v1;
		value2 = v2;
		value3 = v3;
	}

	public void print() {
		System.out.println( value1 + ", " + value2 + ", " + value3 );
	}
}
