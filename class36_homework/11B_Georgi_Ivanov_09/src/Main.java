import java.io.IOException;
import javax.crypto.Cipher;
import java.security.Key;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.util.Scanner;

public class Main {
	private static Scanner in;
	private static String m;	
	static Key pubKey = null, priKey;

	public static void main(String[] args) throws IOException, NoSuchAlgorithmException {
		in = new Scanner(System.in);

		System.out.println("Please insert a message");
		m = in.nextLine();

		KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
		keyPairGenerator.initialize(1024);
		KeyPair keyPair = keyPairGenerator.genKeyPair();

		pubKey = keyPair.getPublic();
		priKey = keyPair.getPrivate();

		byte[] encryptedData = encryptData(m);
		decryptData(encryptedData);
	}

	private static byte[] encryptData(String data) throws IOException {  
		System.out.println("Data Before Encryption = " + data);  
		byte[] dataToEncrypt = data.getBytes();  
		byte[] encryptedData = null;  
		try {  
			Cipher cipher = Cipher.getInstance("RSA");  
			cipher.init(Cipher.ENCRYPT_MODE, pubKey);  
			encryptedData = cipher.doFinal(dataToEncrypt);  
			System.out.println("Encryted Data = " + encryptedData);  

		} catch (Exception e) {  
			e.printStackTrace();  
		}     

		return encryptedData;  
	}  

	private static void decryptData(byte[] encryptedData) throws IOException {  
		byte[] descryptedData = null;  

		try {  
			Cipher cipher = Cipher.getInstance("RSA");  
			cipher.init(Cipher.DECRYPT_MODE, priKey);  
			descryptedData = cipher.doFinal(encryptedData);  
			System.out.println("Decrypted Data = " + new String(descryptedData));  

		} catch (Exception e) {  
			e.printStackTrace();  
		}     
	}  
}