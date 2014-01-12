package elsys.class22.homework;

public class Guitar  {
	int numOfStrings;
	int price;
	String brand;
	String model;
	String body;
	String wood;
	
	public Guitar(int guitarStrings, int guitarPrice, String guitarBrand, String guitarModel, String guitarBody,
			String guitarWood) {
		
		this.numOfStrings = guitarStrings;
		this.price =  guitarPrice;
		this.brand = guitarBrand;
		this.model = guitarModel;
		this.body = guitarBody;
		this.wood = guitarWood;
	}

	public int getNumOfStrings() {
		return numOfStrings;
	}

	public int getPrice() {
		return price;
	}

	public String getBrand() {
		return brand;
	}

	public String getModel() {
		return model;
	}

	public String getBody() {
		return body;
	}

	public String getWood() {
		return wood;
	}
}