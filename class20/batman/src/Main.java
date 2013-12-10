import CarCompany.Honda;
import CarCompany.Mazda;

public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Honda honda = new Honda(15, 900, 2);
		honda.GetEngineSize();
		Mazda mazda = new Mazda(20, 10, 1);
		mazda.GetEngineSize();
	}
}
