package org.elsys.polymorfism;

public class Horse implements Runnable {
	private String name;

	public Horse(String name) {
		this.name = name;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Horse) {
			return name.equals(((Horse) obj).getName());
		} else {
			return false;
		}
	}
	
	@Override
	public void run() {
		System.out.println("GALOPIRAM");
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
