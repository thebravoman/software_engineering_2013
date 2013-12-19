package homework23;

public class Group {
	int members;

	public Group() {
		this.members = 1 + (int) (Math.random() * 3);
	}

	public int getMembers() {
		return this.members;
	}
}
