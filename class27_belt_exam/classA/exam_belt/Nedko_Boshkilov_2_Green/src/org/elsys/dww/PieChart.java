package org.elsys.dww;

public class PieChart extends Chart implements NedkoBoshkilov2
{
	PieChart(int val1,int val2, int val3)
	{
		value1=val1;
		value2=val2;
		value3=val3;
	}
	PieChart()
	{
		this(0,0,0);
	}
	
	public void nedko()
	{
		value2-=value1;
	}
}
