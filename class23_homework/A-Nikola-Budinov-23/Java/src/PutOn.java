import java.io.IOException;


public class PutOn
{
	void filler() throws IOException 
	{
		int grupa = 0;
		int i = 0;
		
		plane Samolet = new plane();
		plane chislo = new plane();
		plane key = new plane();
	
	while(i< 27*6)
	{
		grupa = chislo.getRandom();
		System.out.println(" Group of " + grupa + " is coming :D ");
		key.keyPress();
	
		i+=grupa;
		Samolet.looker(grupa);
		Samolet.display();
		//System.out.println("-Ppl- " + i);
		//System.out.println();

	}
	
	}
}

