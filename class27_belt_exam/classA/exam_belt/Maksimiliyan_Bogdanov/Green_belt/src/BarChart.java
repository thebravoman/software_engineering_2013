public class BarChart implements MaksimiliyanBogdanov4 {

        private int value1;
        private int value2;
        private int value3;

        BarChart(int value) {
                value1 = value * 3;
                value2 = value * 5;
        }
        
        BarChart() {
                value1 = 0;
                value2 = 0;
        }
        public void maksimiliyan() {
                value2 += value1 * 2;
        }
        
        public int getValue1() {
                return value1;
        }
        
        public int getValue2() {
                return value2;
        }
        
}