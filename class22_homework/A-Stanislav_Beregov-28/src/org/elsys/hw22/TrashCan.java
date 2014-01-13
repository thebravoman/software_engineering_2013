package org.elsys.hw22;

public class TrashCan {
	private static int ID;
	int UID;
	int profit;
	
	static{
		ID = 0;
	}
	
	TrashCan(int profit){
		this.profit = profit;
		UID = ID++;
	}
	
	int getAmount(){
		return ID;
	}

}
