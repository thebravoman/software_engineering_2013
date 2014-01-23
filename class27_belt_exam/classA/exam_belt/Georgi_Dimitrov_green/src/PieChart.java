public class PieChart extends Chart implements GeorgiDimitrov3 {

        public PieChart(int value1, int value2, int value3) {
                super(value1, value2, value3);
        }

        @Override
        public void georgi() {
                setValue2(getValue2() - getValue1());
        }

}