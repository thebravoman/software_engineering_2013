package elsys.class24.p2;

public class DataStructure {
	private final static int SIZE =15;
	private int[] arrayOfInts = new int[SIZE];
	
	public DataStructure() {
		for(int i = 0; i < SIZE; ++i) {
			arrayOfInts[i] = i;
		}
	}
	
	private class InnerEventIterator {
		private int next = 0;
		
		public boolean hasNext() {
			return (next<SIZE);
		}
		
		public int getNext() {
			int retValue = arrayOfInts[next];
			next +=2;
			return retValue;
		}
	}
	
	public void printEvent() {
		InnerEventIterator iterator = new InnerEventIterator();
		while(iterator.hasNext()) {
			System.out.print(iterator.getNext() + " ");
		}
		
	}
	
	public static void main(String[] args) {
		DataStructure dS = new DataStructure();
		dS.printEvent();
	}
	
	
	
	
	
	
	
	
}
