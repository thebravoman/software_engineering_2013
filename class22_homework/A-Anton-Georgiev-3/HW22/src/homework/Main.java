package homework;

import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;

public class Main {
	public static void main(String[] args) {
		LinkedList<Plane> planes = new LinkedList<Plane>();
		planes.add(new Plane("Boeing", "747-400",9924));
		planes.add(new Plane("Boeing", "737-800",9925));
		planes.add(new Plane("Airbus", "A320",4141));
		planes.add(new Plane("Airbus", "A380",5120));
		
		Collections.sort(planes, new Comparator<Plane>() {
			@Override
			public int compare(Plane o1, Plane o2) {
				return Double.compare(o1.registration, o2.registration);
			}
		});
	}
}