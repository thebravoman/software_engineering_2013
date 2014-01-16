package org.elsys.belt;

public class PieChart implements DenisKalfov4{
		
	private int value1;
	private int value2;
	private int value3;

	PieChart(int value1,int value2,int value3){
		this.value1=value1;
		this.value2=value2;
		this.value3=value3;
		
	}
		
	
	@Override
	public void denis(int value1, int value2) {
		this.value2-=value1;
	}

	
	public void Denis() {
			this.value2=(Math.abs(value2));
	}
	
}
