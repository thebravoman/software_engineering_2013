package org.elsys.greenbelt;
public class BarChart implements DenisKalfov4{

	public BarChart(int value1,int value2) {
		super();
	}

	@Override
	public int denis(int value1,int value2) {
		value2 += (value1*2);
		return value2;
	}

	
//	Методът увеличава стойността на value2 със стойността на value1*2
	
}
