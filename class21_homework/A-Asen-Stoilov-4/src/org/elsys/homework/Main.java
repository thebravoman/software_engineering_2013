package org.elsys.homework;

public class Main {

	public static void main(String[] args) {
		Ball ball1 = new Ball();
		ball1.setCapacity(6);
		Ball ball2 = new Ball();
		ball2.setCapacity(8.5);
		
		BallContainer cont = new BallContainer();
		
		cont.add(ball1);
		cont.add(ball2);
		
		System.out.println(cont.getCapacity());
		
		Box box = new Box(14.5);
		box.add(ball1);
		box.add(ball2);
		
		for (int i=0;i< box.getBallsFromSmallest().size(); i++)
			System.out.println(box.getBallsFromSmallest().get(i).getCapacity());
	}

}
