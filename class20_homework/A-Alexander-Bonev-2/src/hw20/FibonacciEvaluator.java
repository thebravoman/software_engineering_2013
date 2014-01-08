package hw20;

public class FibonacciEvaluator implements IEvaluator {
    double sum = 0;
    private boolean abs;
    public FibonacciEvaluator(boolean abs){
            this.abs = abs;
    }
    int fib(int n) {
            if(n<0)return -1;
            else if (n==0)return 0;
            else if (n==1) return 1;
            else if (n>1)return fib(n-1) + fib(n-2);
            return 0;
    }
    public void add(double d){
            if(abs)sum += Math.abs(d);
            else sum += d;
    }
    public Double evaluate(){
            int i;
            for(i = 0; fib(i) < sum; ++i);
            return (double) (fib(i)-sum < sum-fib(i-1) ? fib(i) : fib(i-1));
    }
}