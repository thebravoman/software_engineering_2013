package CarCompany;

public class Car implements Engine, Wheel {
	public int tireSize;
	public int horsePower;
	public int oilType;
		
	/**
	 * @param tireSize this is the size of the 
	 * @param horsePower
	 * @param oilType
	 */
	public Car(int tireSize, int horsePower,int oilType) {
		this.setTireSize(tireSize);
		this.setHorsePower(horsePower);
		this.setOilType(oilType);
	}
	
	public int getTireSize() {
		return tireSize;
	}

	public void setTireSize(int tireSize) {
		this.tireSize = tireSize;
	}

	public int getHorsePower() {
		return horsePower;
	}

	public void setHorsePower(int horsePower) {
		this.horsePower = horsePower;
	}

	
	public int getOilType() {
		return oilType;
	}

	public void setOilType(int oilType) {
		this.oilType = oilType;
	}

	@Override
	public void GetType() {
		System.out.println(this.getOilType());
	}

	@Override
	public void GetHorsePower() {
		System.out.println(this.getHorsePower());
	}

	@Override
	public void GetOilLevel() {
		// TODO Auto-generated method stub
		System.out.println("no oil found");
	}

	@Override
	public void GetWheelSize() {
		// TODO Auto-generated method stub
		System.out.println("20");
	}

	@Override
	public void GetEngineSize() {
		// TODO Auto-generated method stub
		System.out.println("60");
	}

}
