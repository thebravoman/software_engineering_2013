package org.elsys.greenbelt;

public class PieChart extends Chart implements StefanStamenov2{
	
		PieChart(int val1,int val2,int val3){
			super(val1, val2, val3);
		}

		public void stefan() {
			this.value2-=value1;
		}
		
}
