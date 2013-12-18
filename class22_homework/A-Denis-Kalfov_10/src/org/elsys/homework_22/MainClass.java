package org.elsys.homework_22;

import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;

public class MainClass {


	public static void main(String[] args) {
		
		LinkedList <Cmp> l = new LinkedList<Cmp>();
		l.add(new Cmp("a","a",1));
		l.add(new Cmp("b","b",2));
		
		Collections.sort(l,new Comparator<Cmp>(){
			@Override
			public int compare(Cmp a1, Cmp b1) {
				return Double.compare(a1.num,b1.num);
			}
		});
		
	}

}