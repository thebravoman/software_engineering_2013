public class Chart {
        
        public int value1;
        public int value2;
        protected int getValue1() {
			return value1;
		}
		protected void setValue1(int value1) {
			this.value1 = value1;
		}
		protected int getValue2() {
			return value2;
		}
		protected void setValue2(int value2) {
			this.value2 = value2;
		}
		protected int getValue3() {
			return value3;
		}
		protected void setValue3(int value3) {
			this.value3 = value3;
		}
		public int value3;
        public Chart(int v1, int v2, int v3){
                value1 = v1;
                value2 = v2;
                value3 = v3;
        }
}