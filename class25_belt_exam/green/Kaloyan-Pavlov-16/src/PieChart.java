public class PieChart extends PieAndBar implements KaloyanPavlov2{

        
        
        PieChart(int value1, int value2, int value3) {
                super(value1, value2, value3);
        }

        @Override
        public void kaloyan() {
                this.val2 -= val1;
        }

}