package elsys.class22.homework;

import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		LinkedList<Guitar> guitars = new LinkedList<Guitar>();
		
		Guitar guitar1 = new Guitar(6, 2110, "Gibson", "Gothic Morte", "Les Paul", "Mahogany" );
		Guitar guitar2 = new Guitar(6, 2214, "Fender", "Ritchie Blackmore Strat (013-9010-305)", "Stratocaster", "Alder");
		Guitar guitar3 = new Guitar(8, 3400, "Ibanez", "RG2228 GK", "Stratocaster", "Basswood");

		guitars.add(guitar1);
		guitars.add(guitar2);
		guitars.add(guitar3);
		
		Collections.sort
        (guitars, new Comparator<Guitar>() {
        	@Override
            public int compare(Guitar price1, Guitar price2) {
        		return Double.compare( price1.getPrice(), price2.getPrice() );
            }
        });
		
		for (Guitar guitar : guitars) {
            System.out.println(guitar.getNumOfStrings() + " " + guitar.getPrice() + " " + guitar.getBrand() +
            		" " + guitar.getModel() + " " + guitar.getBody() + " " + guitar.getWood());
        }
	}

}


