package org.elsys.polymorphism;

public class MainClass {
	public static void main(String[] args) {

		Object r1 = new Horse("MATILDA");
		Horse r2 = new Horse("BARON");
		Object r3 = new Horse("BARON");
		Kangaroo k = new Kangaroo("MATILDA");

		System.out.println(r2.equals(r3));
		System.out.println(r1.equals(k));
		System.out.println(r2.equals(r3));
	}
}
