package ball;


public class Ball {
	private double capacity;
	
	public Ball(double capacity){
		setCapacity(capacity);
	}
	public void setCapacity(double capacity){
		if(capacity>0){
			this.capacity = capacity;
		}
		else{
			this.capacity = 0;
		}
	}
	public double getCpacity(){
		return capacity;
	}
}
