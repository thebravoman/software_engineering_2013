package org.elsys.polymorfism;


public class MainClass {
	public static void main(String[] args) {
		Runnable h1 = new Horse("PESHO");
		Runnable h2 = new Horse("IVAN");
		Runnable h3 = new Horse("IVAN");
		Runnable p = new Pigeon();
		System.out.println(h1.equals(p));
		System.out.println(h2.equals(h3));

		//second part
		Farm farm = new Farm();
		for(int i = 0; i < 10; i++) {
			if (i % 2 == 0) {
				farm.addAnimal(new Horse("Horse #"));
			} else {
				farm.addAnimal(new Pigeon());
			}
		}
		farm.walkTheAnimals();
	}
}
