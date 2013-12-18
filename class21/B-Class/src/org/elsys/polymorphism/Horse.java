package org.elsys.polymorphism;

public class Horse extends BaseRunnable {

	public Horse(String name) {
		super(name);
	}

	@Override
	public void run() {
		System.out.println("GALOPIRAM");
	}
}
