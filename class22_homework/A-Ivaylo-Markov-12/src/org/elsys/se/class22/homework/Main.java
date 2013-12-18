package org.elsys.se.class22.homework;
import java.util.*;

public class Main {
	
	List<HamRadioBeacon> beacons = new ArrayList<HamRadioBeacon>();
	
	public static void main(String[] args) {
		List<HamRadioBeacon> beacons = new ArrayList<HamRadioBeacon>();
		
		beacons.add(new HamRadioBeacon("LZ0DLS ", 10.14025, "KN12PQ"));
		beacons.add(new HamRadioBeacon("LZ0VVV ", 1296.810, "KN12PQ"));
		beacons.add(new HamRadioBeacon("LZ1RR ", 144.414, "KN12TE"));
		beacons.add(new HamRadioBeacon("LZ0TWO ", 144.4625, "KN2XS"));
		beacons.add(new HamRadioBeacon("LZ0SJB ", 50.050, "KN32DR"));
		beacons.add(new HamRadioBeacon("LZ0MON ", 50.054, "KN13OJ"));
		beacons.add(new HamRadioBeacon("LZ0SIX ", 50.062, "KN22XS"));
		
		System.out.println("Unsorted LZ ham radio beacons:");
		printAllBeacons(beacons);
		
		Collections.sort(beacons,new Comparator<HamRadioBeacon>(){

			@Override
			public int compare(HamRadioBeacon one, HamRadioBeacon two) {
				return Double.compare(one.getTxFrequency(),two.getTxFrequency());
			}
			
		});
		
		System.out.println("Sorted LZ ham radio beacons:");
		printAllBeacons(beacons);
		
	}
	
	private static void printAllBeacons(List<HamRadioBeacon> beacons) {
		for(int i=0;i<beacons.size();++i) {
			beacons.get(i).printInfo();
		}
		System.out.println();
	}

}
