package Homework20;

public class SumEvaluator implements IEvaluator {
        private double sum = 0;
        
        @Override
        public void add(double d) {
                this.sum = this.sum + d;
        }

        @Override
        public double evaluate() {
                return this.sum;
        }
}
