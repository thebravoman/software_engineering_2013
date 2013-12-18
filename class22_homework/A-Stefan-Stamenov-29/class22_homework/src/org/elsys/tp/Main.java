package org.elsys.tp;

import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;

public class Main {
	public static void main(String[] args) {
		LinkedList<Team> apfg=new LinkedList<Team>();
		Team Levski=new Team("Levski","Sofia",1914);
		Team Botev=new Team("Botev", "Plovdiv", 1912);
		Team ChernoMore=new Team("Cherno More","Varna", 1945);
		Team PirinGD=new Team("Pirin", "Goce Delchev", 1925);
		
		apfg.add(Levski);
		apfg.add(Botev);
		apfg.add(ChernoMore);
		apfg.add(PirinGD);
		
		
	Collections.sort(apfg,new Comparator<Team>() {
		@Override
		public int compare(Team t1,Team t2){
			return Double.compare(t1.year,t2.year);
		}
	});	
	}
	
}
