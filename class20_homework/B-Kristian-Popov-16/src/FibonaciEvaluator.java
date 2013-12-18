public class FibonaciEvaluator implements IEvaluator {

        private double currentSum;
        
        public FibonaciEvaluator() {
                this.currentSum = 0.0;
        }
        
        @Override
        public void add(double d) {
                this.currentSum += d;
        }

        @Override
        public Double evaluate() {
                double currentFibonaci = 1.0;
                double previousFibonaci = 1.0;
                
                while(currentFibonaci < currentSum ){
                        currentFibonaci += previousFibonaci;
                }
                
                if ((currentFibonaci - this.currentSum)<(this.currentSum - previousFibonaci))
                        return currentFibonaci;
                else
                        return previousFibonaci;
        }

}
