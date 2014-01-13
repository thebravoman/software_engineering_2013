package hw20;

public class SumEvaluator implements IEvaluator {
    double sum = 0;
    private boolean abs;
    public SumEvaluator(boolean abs){
            this.abs = abs;
    }
    public void add(double d){
            if(abs)sum += Math.abs(d);
            else sum += d;
    }
    public Double evaluate(){
            return sum;
    }
}