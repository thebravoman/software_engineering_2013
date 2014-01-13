package Homework3;

public class FibonaciEvaluator implements IEvaluator{
	 private double sum;
     
     public FibonaciEvaluator() {
         this.sum = 0.0;
     }
     
     @Override
     public void add(double d) {
         this.sum += d;
     }

     private double fibonaci(double fibo) {
    	 double num = 0;
    	 if ((fibo == 1)||(fibo == 2)) {
    		 num = 1;
    	 }
    	 else if (fibo > 2.0) {
    		 num = fibonaci(fibo-1) + fibonaci(fibo-2);
    	 }
    	 return num;
     }
     
     @Override
     public double evaluate() {
         double fib = 1.0;
         while(fibonaci(fib) < sum) {
        	 fib++;
         }
         
         if (fibonaci(fib) - sum < sum - fibonaci(fib-1)) {
        	 return fibonaci(fib);
         }else{
        	 return fibonaci(fib-1);
         }
     }
     
        
}