package org.elsys.polymorphism;

import java.util.LinkedList;
import java.util.List;

public class Farm {
	private List<Runnable> animals = new LinkedList<Runnable>();

	public List<Runnable> getAnimals() {
		return animals;
	}

	public void setAnimals(List<Runnable> animals) {
		this.animals = animals;
	}
	
	/**
	 * Use this method to add new runnables to your Farm object.
	 * @param runnable The Runnable object to be added
	 */
	public void addAnimal(Runnable runnable) {
		animals.add(runnable);
	}
	
	/**
	 * Use this method to take the animals out for a walk.
	 */
	public void walkTheAnimals() {
		for(Runnable r : animals) {
			r.run();
		}
	}
}
