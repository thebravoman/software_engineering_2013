

public class DSA extends Main{
	
	public static void dsa() throws Exception{
		System.out.println("Enter 1 to generate DSA key");
		System.out.println("Enter 2 to encrypt/decrypt a message");
		int choice =0;
		
		while(choice != 1 || choice != 2){
			choice = intFromKb();
			switch(choice){
				case 1: KeyGeneratorDSA.keyGeneratorDSA();;
					break;
				case 2: EnDecryptorDSA.enDeCryptorDSA();
					break;
			}
		}
	}
	
}