package sixthHomework;

public class Group {
	private int groupSize;
	
	public Group() {
		this.groupSize = 1 + (int)(Math.random() * ((3 - 1) + 1));
	}
	
	public int getSize() {
		return this.groupSize;
	}
}
