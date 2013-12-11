package CarCompany;

public class Honda extends Car{

	public Honda(int tireSize, int horsePower, int oilType) {
		super(tireSize, horsePower, oilType);
	}
	
	@Override
	public void GetEngineSize() {
		System.out.println("150");
	}
	
	public void PrintHonda(){
		System.out.println("Honda");
	}
}
