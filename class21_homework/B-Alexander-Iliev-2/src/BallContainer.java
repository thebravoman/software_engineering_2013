import java.util.LinkedList;


public class BallContainer {
	int size;
	LinkedList<Ball> ballList = new LinkedList<>();
	
	public BallContainer() {
		this.size = 0;
	}
	
	void add(Ball b){
		ballList.add(b);
		this.size += 1;
	}
	void remove(Ball b){
		ballList.remove(b);
		this.size -= 1;
	}
	int getCapacity(){
		int allCapacity = 0;
		for (int i = 0;i < ballList.size();i++){
			allCapacity += ballList.get(i).getCapacity();
		}
		
		return allCapacity;
	}

	int size(){
		return this.size;
	}

	void clear(){
		ballList.clear();
		this.size = 0;
	}

	boolean contains(Ball b){
		return ballList.contains(b);
	}
	
	public static void main(String[] args) {
		BallContainer container = new BallContainer();
		Box box = new Box(3);
		
		Ball b1 = new Ball(5);
		Ball b2 = new Ball(6);
		
		container.add(b1);
		container.add(b2);
		container.add(new Ball(9));
		
		box.add(b1);
		box.add(b2);
		box.add(new Ball(9));
		
		
//		box.add(b1);
//
//		System.out.println(container.size);
//		System.out.println(container.getCapacity());
//		System.out.println(container.contains(b1));
//		System.out.println(box.getCapacity());
//		System.out.println(box.size);
		
		Object[] s = box.getBallsFromSmallest().toArray();
		

		for (int i = 0;i < box.size;i++){
			System.out.println(s[i]);
		}
		
	}
}
