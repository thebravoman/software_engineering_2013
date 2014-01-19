
public class LocalClassExample {

	static String regExp = "[^0-9]";
	
	public static void validatePhoneNumber(String phoneNumber1,
			String phoneNumber2){
		
		final int numberLength = 10;
		
		class PhoneNumber{
			private String formattedNumber = null;
			
			PhoneNumber(String phoneNumber){
				//09-87-87 => 098787
				String currentNumber = phoneNumber.replaceAll(regExp, "");
				
				if (currentNumber.length() == numberLength)
					formattedNumber = currentNumber;
				else
					formattedNumber = null;
			}
			
			public String getNumber(){
				return formattedNumber;
			}
			
		}
		
		PhoneNumber pN1 = new PhoneNumber(phoneNumber1);
		PhoneNumber pN2 = new PhoneNumber(phoneNumber2);
		
		if (pN1.getNumber() != null)
			System.out.println("The Number is: " + pN1.getNumber());
		else
			System.out.println("Incorrect Number!");
		
		if (pN2.getNumber() != null)
			System.out.println("The Number is: " + pN2.getNumber());
		else
			System.out.println("Incorrect Number");
	}
	
	public static void main(String[] args) {
		//the numbers should contain 10 digits to be correct
		validatePhoneNumber("0123456789", "01-23-45-67-89");
	}

}
