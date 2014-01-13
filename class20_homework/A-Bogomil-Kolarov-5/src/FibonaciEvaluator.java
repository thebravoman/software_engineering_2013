public class FibonaciEvaluator implements IEvaluator {
	private double temp = 0.0;
	
	public void add(double d) {
		this.temp += d;
	}
	
	public Double evaluate() {
	    double f0 = 0; 
	    double f1 = 1; 

	    while(f0 <= temp || f1 <= temp) { 
	        double temp = f1;
	        f1 += f0; 
	        f0 = temp; 
	    } 
	    if(f0 > f1) {
	    	return f1;
	    }else {
	    	return f0;
	    }
	}
}
