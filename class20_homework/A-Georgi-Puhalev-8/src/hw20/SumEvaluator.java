package hw20;

public class SumEvaluator  implements IEvaluator {

		private double sum;
		
		public SumEvaluator(){
			this.sum=0.0;
		}
			
		public void add(double d) {
			this.sum+=d;
		}
		public double evaluate() {
			return this.sum;
		}
}
