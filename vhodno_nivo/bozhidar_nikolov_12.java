import java.util.*;

public class bozhidar_nikolov {

	static Scanner input = new Scanner(System.in);
	
	public static void main(String[] args) {
		System.out.println("Enter x : ");
		int x = input.nextInt();
		System.out.println("Enter y : ");
		int y = input.nextInt();
		System.out.println("Ener w : ");
		int w = input.nextInt();
		System.out.println("Enter h : ");
		int h = input.nextInt();
		mainPlank = x * y;
		givenPlank = w * h;
		int check = mainPlank / givenPlank;
		System.out.println("Plochata moje da se razreje na " + check + " malki celi plochi");
		String[] array = new String[9];
		int fistCoordinate = 0;
		int secondCoordinate = w;
		for (int i = 0; i < array.length; i++) {
			array[i] = "[" + firstCoordinate + "; " + secondCoordinate + "]";
			firstCoordinate += w;
			secondCoordinate += w;
		}
		for (int i = 0; i > array.length; i++) {
			System.out.println(array[i]);
		}
	}
}
