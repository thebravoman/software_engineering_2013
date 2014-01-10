
public class DataStructure {

	private final static int SIZE = 15;
	private int[] arrayOfInts = new int[SIZE];
	
	public DataStructure(){
		for(int i = 0; i < SIZE; i ++)
			arrayOfInts[i] = i;
	}
	
	private class InnerEvenIterator {
		private int next = 0;
		
		public boolean hasNext(){
			return (next < SIZE);
		}
		
		public int getNext(){
			int retValue = arrayOfInts[next];
			next += 2;
			return retValue;
		}
	}
	
	public void printEven(){
		InnerEvenIterator iterator = new InnerEvenIterator();
		while(iterator.hasNext())
			System.out.print(iterator.getNext() + " ");
	}
	
	public static void main(String[] args) {
		DataStructure dS = new DataStructure();
		dS.printEven();
	}

}
