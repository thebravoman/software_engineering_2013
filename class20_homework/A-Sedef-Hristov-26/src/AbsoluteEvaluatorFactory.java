package thirdHomework;

public class AbsoluteEvaluatorFactory implements IEvaluatorFactory {

        @Override
        public IEvaluator createSumEvaluator() {
                return new SumEvaluator() {
                        public void add(double d) {
                                super.add(Math.abs(d));
                        }
                };
        }

        @Override
    public IEvaluator createPowerOnEvaluator() {
                        return this.createPowerOnEvaluator(2.0);
    }

        @Override
        public IEvaluator createPowerOnEvaluator(double power) {
                return new PowerOnEvaluator(power) {
            public void add(double d) {
                    super.add(Math.abs(d));
            }
                };
        }

        @Override
        public IEvaluator createFibonaciEvaluator() {
                return null;
        }

}
