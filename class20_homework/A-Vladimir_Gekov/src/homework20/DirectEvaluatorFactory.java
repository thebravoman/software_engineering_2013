package Homework20;

public class DirectEvaluatorFactory implements IEvaluatorFactory {

        @Override
        public IEvaluator createSumEvaluator() {
                IEvaluator eval = new SumEvaluator();
                
                return eval;
        }

        @Override
        public IEvaluator createPowerOnEvaluator() {
                IEvaluator eval = new PowerOnEvaluator(2.0);
                
                return eval;
        }

        @Override
        public IEvaluator createPowerOnEvaluator(double power) {
                IEvaluator eval = new PowerOnEvaluator(power);
                
                return eval;
        }

        @Override
        public IEvaluator createFibonaciEvaluator() {
                // TODO Auto-generated method stub
                return null;
        }
        
}
