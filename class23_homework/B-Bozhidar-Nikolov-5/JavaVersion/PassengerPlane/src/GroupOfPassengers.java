import java.util.Random;

public class GroupOfPassengers {
	
	private int size;
	
	public void setSize() {
		Random randomSize = new Random();
		this.size = randomSize.nextInt((3 - 1) + 1) + 1;
	}
	
	public int getSize() {
		return this.size;
	}
}