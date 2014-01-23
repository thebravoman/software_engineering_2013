public class PieChart {        
        
        private int value1;
        private int value2;

        PieChart(int value) {
                value1 = value * 2;
                value2 = value * 4;
        }
        
        PieChart() {
                value1 = 0;
                value2 = 0;
        }

        public int getValue1() {
                return value1;
        }
        
        public int getValue2() {
                return value2;
        }
}