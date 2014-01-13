package org.elsys.polymorfism;

import java.util.LinkedList;
import java.util.List;

public class Farm {
	private List<Runnable> runningAnimals = new LinkedList<Runnable>();

	public void addAnimal(Runnable animal) {
		runningAnimals.add(animal);
	}
	
	public void walkTheAnimals() {
		for(Runnable r : runningAnimals) {
			r.run();
		}
	}
	
	public List<Runnable> getRunningAnimals() {
		return runningAnimals;
	}

	public void setRunningAnimals(List<Runnable> runningAnimals) {
		this.runningAnimals = runningAnimals;
	}
}
