package org.elsys.polymorphism;

public class Kangaroo extends BaseRunnable {

	public Kangaroo(String name) {
		super(name);
	}

	@Override
	public void run() {
		System.out.println("PODSKACHAM");
	}

}
