package Homework20;

public class PowerOnEvaluator implements IEvaluator {
        private double result;
        private double power;
        
        public PowerOnEvaluator(double power) {
                this.result = 0.0;
                this.power = power;
        }

        @Override
        public void add(double d) {
                this.result = this.result + Math.pow(result, power);
        }

        @Override
        public double evaluate() {
                return this.result;
        }
        
}
