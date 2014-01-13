package org.elsys.hw22;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Main {
	
	public static void main(String[] args) {
		List<TrashCan> cans = new ArrayList<TrashCan>();
		cans.add(new TrashCan(50));
		cans.add(new TrashCan(60));
		cans.add(new TrashCan(70));
		cans.add(new TrashCan(80));
		cans.add(new TrashCan(90));
		cans.add(new TrashCan(10));
		cans.add(new TrashCan(20));
		cans.add(new TrashCan(30));
		cans.add(new TrashCan(40));
		cans.add(new TrashCan(50));
		cans.add(new TrashCan(60));
		cans.add(new TrashCan(70));
		cans.add(new TrashCan(80));
		System.out.println("there are " + cans.get(0).getAmount() + " trash cans!" );
		
		ransackAndSort(cans);
		
		System.out.println("Now the garbage is sorted!");

	}
	static void ransackAndSort(List<TrashCan> cans){
        Collections.sort(cans, new Comparator<TrashCan>( ) {
            public int compare( TrashCan a, TrashCan b ) {
            		System.out.println("Ransacking can " + a.UID);
                    return Double.compare( a.profit, b.profit );
            }
        });
	}

}
