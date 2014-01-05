package elsys.homework;

public class GroupGenerator {
	private int passengers;
	
	public int randomGroup(int max) {
		this.passengers = 1 + (int)(Math.random() * max);
		return passengers;
	}
}