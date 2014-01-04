package homework;

import java.util.Random;

public class HumanGenerator {
	public int generateHumans() {
		Random rand = new Random();
		return rand.nextInt(3)+1;
	}
}