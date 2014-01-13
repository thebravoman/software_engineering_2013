package org.elsys.se.class23.homework.people;
import java.util.*;

public class Group {
	private List<Passenger> members;
	
	public Group() {
		members = new ArrayList<Passenger>();
	}
	
	public Passenger getMember(int i) {
		return members.get(i);
	}
	
	public void addMember(Passenger newMember) {
		members.add(newMember);
	}
	
	public int getSize() {
		return members.size();
	}
	
	public void clear() {
		members.clear();
	}

}
