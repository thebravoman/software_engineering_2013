package Elsys.Homework;

public class Group {
	private int size;
	
	public Group(){
		this.size = 1 + (int)(Math.random() * 3);
	}
	
	public int getSize(){
		return this.size;
	}
}
