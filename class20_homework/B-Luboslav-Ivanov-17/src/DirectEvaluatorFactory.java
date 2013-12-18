
public class DirectEvaluatorFactory implements IEvaluatorFactory {


        public IEvaluator createSumEvaluator() {
                return new SumEvaluator();
        }

        public IEvaluator createPowerOnEvaluator() {
                return this.createPowerOnEvaluator(2.0);
        }

        public IEvaluator createPowerOnEvaluator(double power) {
                return new PowerOnEvaluator(power);
        }

        public IEvaluator createFibonacciEvaluator() {
                return new FibonacciEvaluator();
        }

}