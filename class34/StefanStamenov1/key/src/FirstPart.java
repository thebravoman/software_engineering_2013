import java.util.Random;



public class FirstPart {

	static boolean isPrime(int n) {
	    for(int i=2;i<n;i++) {
	        if(n%i==0)
	            return false;
	    }
	    return true;
	}	
public static int randPrim(){
	boolean trig=false;
		while (trig==false){
			Random rand = new Random();
			int  n1 = rand.nextInt(512) + 128;
			if (isPrime(n1)){
				//System.out.println(n1);

				trig=true;
				return n1;
			}
			}
		return 0;
	}
	
private static int findGCD(int number1, int number2) {
    if(number2 == 0){
        return number1;
    }
    return findGCD(number2, number1%number2);
}	
	
	public static void main(String[] args) {
			
	int p,q,n,fn,e=0,r,d,i=1;
	do{
		p=randPrim();
		q=randPrim();
	}while(q==p);
	//System.out.println(p);
	//System.out.println(q);
	
	n=p*q;
	fn=(p-1)*(q-1);
	
	do{
		Random rand = new Random();
		r = rand.nextInt(fn) + 1;
		if (findGCD(r,fn)==1){
			e=r;
		}
	}while(e!=r);
	
	while(true){
		if((fn*i+1)%e==0){
			d=(fn*i+1)/e;
			break;
		}
		i++;
	}
	
	System.out.println("pub "+n+" "+e);
	System.out.println("pri "+n+" "+d);
	}	

}