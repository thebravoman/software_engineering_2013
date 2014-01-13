package homework23;

public class Group {

	public int members;

	/**
	 * Generates a group with random members [1;3]
	 */
	public Group() {
		this.members = 1 + (int) (Math.random() * 3);
	}

	public int getMembers() {
		return this.members;
	}

}
