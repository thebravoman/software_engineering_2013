package homework22;

import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;

public class MainClass {

	public static void main(String[] args) {
		
		LinkedList<Card> card = new LinkedList<>();
		
		Card card1 = new Card("Spatiq", 1, "7");
		Card card2 = new Card("Kupa", 3, "A");
		Card card3 = new Card("Karo", 2, "Q");
		Card card4 = new Card("Pika", 4, "2");
		
		card.add(card1);
		card.add(card2);
		card.add(card3);
		card.add(card4);
		
		Collections.sort(card, new Comparator<Card>() {
			
			@Override
			public int compare(Card o1, Card o2) {
				return Double.compare( o1.value, o2.value );
		
	
		}		
		
		});
		
		for (Card currentCard : card) {
			System.out.print(currentCard.name);
			System.out.print(" ");
			System.out.println(currentCard.color);
		}

	}
}
	


